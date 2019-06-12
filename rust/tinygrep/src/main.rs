extern crate tinygrep;

use std::env; 
use std::process;

use tinygrep::Config;

fn main() {
    let args: Vec<String> = env::args().collect();

    let config = Config::new(&args).unwrap_or_else(|err| {
        eprintln!("Problem parsing arguments: {}", err);
        process::exit(1);
    });

    println!("searching for '{}'", config.query);
    println!("in file {}", config.filename);

    if let Err(e) = tinygrep::run(config) {
        eprintln!("Application error: {}", e);

        process::exit(1);
    }
}

