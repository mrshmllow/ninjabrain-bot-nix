use std::{
    char,
    io::{self, Read},
};

use hex_color::HexColor;
use serde::{Deserialize, Deserializer};

// https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/main/java/ninjabrainbot/gui/themeeditor/ThemeSerializer.java#L14-L15
const FILTER_6BIT: u32 = 0b11_1111;
const SHIFT_SIZE: u32 = 6;

#[allow(non_snake_case)]
#[derive(Deserialize)]
struct Base16 {
    #[serde(deserialize_with = "add_hash")]
    base00: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base01: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base02: HexColor,
    // base03: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base04: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base05: HexColor,
    // base06: HexColor,
    // base07: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base08: HexColor,
    // base09: HexColor,
    // base0A: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base0B: HexColor,
    // base0C: HexColor,
    // base0D: HexColor,
    #[serde(deserialize_with = "add_hash")]
    base0E: HexColor,
    // base0F: HexColor,
}

fn add_hash<'de, D>(d: D) -> Result<HexColor, D::Error>
where
    D: Deserializer<'de>,
{
    let s = String::deserialize(d)?;

    format!("#{s}")
        .parse::<HexColor>()
        .map_err(serde::de::Error::custom)
}

impl Base16 {
    fn tag_and_colour(tag: char, colour: hex_color::HexColor) -> String {
        format!("{tag}{}", serialize_colour(colour))
    }

    fn ninb_theme(self) -> String {
        let mut string = String::new();

        // these come from https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/main/java/ninjabrainbot/gui/style/theme/CustomTheme.java#L26

        // title bar
        string += &Base16::tag_and_colour('a', self.base00);
        // header background
        string += &Base16::tag_and_colour('b', self.base01);
        // result background
        string += &Base16::tag_and_colour('c', self.base02);
        // throws background
        string += &Base16::tag_and_colour('d', self.base02);
        // dividers
        string += &Base16::tag_and_colour('e', self.base01);
        // darker dividers
        string += &Base16::tag_and_colour('f', self.base00);
        // g skipped ?
        // foreground
        string += &Base16::tag_and_colour('h', self.base05);
        // title foreground
        string += &Base16::tag_and_colour('n', self.base04);
        // foreground (throws)
        string += &Base16::tag_and_colour('k', self.base05);
        // divine text
        string += &Base16::tag_and_colour('i', self.base05);
        // version text
        string += &Base16::tag_and_colour('j', self.base04);
        // "header text" (table headers)
        string += &Base16::tag_and_colour('o', self.base05);
        // good aka diff inserted
        string += &Base16::tag_and_colour('l', self.base0B);
        // bad aka diff deleted
        string += &Base16::tag_and_colour('m', self.base08);

        // these use inserted, changed, deleted colours
        // 100%
        // 50%
        // 0%
        string += &Base16::tag_and_colour('r', self.base0B);
        string += &Base16::tag_and_colour('q', self.base0E);
        string += &Base16::tag_and_colour('p', self.base08);

        html_escape::encode_text(&string).to_string()
    }
}

// https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/main/java/ninjabrainbot/gui/themeeditor/ThemeSerializer.java#L96
fn to_char(i: u32) -> char {
    assert!(i < 64, "i must be between 0 and 63");

    char::from_u32(i + u32::from(b'0')).unwrap()
}

// https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/main/java/ninjabrainbot/gui/themeeditor/ThemeSerializer.java#L77
fn serialize_int(i: u32, bits: u32) -> String {
    let mut bits = bits;
    let mut i = i;

    let mut string = String::new();

    while bits > 0 {
        string = format!("{}{}", to_char(i & FILTER_6BIT), string);
        i >>= SHIFT_SIZE;
        bits -= SHIFT_SIZE;
    }

    string
}

// https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/main/java/ninjabrainbot/gui/themeeditor/ThemeSerializer.java#L67-L69
fn serialize_colour(color: hex_color::HexColor) -> String {
    serialize_int(color.to_u24(), 24)
}

fn main() -> io::Result<()> {
    let mut buffer = String::new();
    let stdin = io::stdin();
    let mut handle = stdin.lock();

    handle.read_to_string(&mut buffer)?;

    let base16: Base16 = serde_norway::from_str(&buffer).unwrap();

    print!("{}", base16.ninb_theme());

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    // https://github.com/Ninjabrain1/Ninjabrain-Bot/blob/34117a46d700610aab0237f73bd9418a09940e5f/src/test/java/ninjabrainbot/gui/themeeditor/ThemeSerializerTests.java#L31
    #[test]
    fn serialize() {
        assert_eq!(serialize_colour(hex_color::HexColor::WHITE), "oooo");
        assert_eq!(serialize_colour(hex_color::HexColor::BLACK), "0000");
        assert_eq!(serialize_colour(hex_color::HexColor::RED), "o`00");
        assert_eq!(serialize_colour(hex_color::HexColor::GREEN), "0?l0");
        assert_eq!(serialize_colour(hex_color::HexColor::BLUE), "003o");
    }
}
