# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      Created a CLI interface in CLI_Interface that includes several menus that a user can interact with and receive information from
- [x] Pull data from an external source
      Scraper pulls data from knitmap.com to populate the information provided by CLI_Interface
- [x] Implement both list and detail views
      CLI_Interface first uses Scraper to provide a list of local yarn stores, then asks the user which store they would like more details about. CLI_Interface uses scraper again to get more details about the store which are then presented to the user. 
