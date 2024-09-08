
# Truelogic test

## Description
The test was made in Rails and has the logic for test in `lib/parsers` folder  
The provided txt files are stored in `storage/app` folder  

## Test
```bash
  ./bin/rails test
```

## Requirements
Make sure to have Ruby 3.2.3 installed.

## Installation
1. Clone this repository to your local machine:
```bash
git clone https://github.com/pichotweb/truelogic_test.git
``` 
2.  Navigate to the project directory:
```bash
cd truelogic-test 
```     
3.   Install dependencies using Bundler:
```bash
bundle install 
```

4. Start the development server, use the following command:0
```bash
./bin/dev
```
The server will be started at http://localhost:3000 by default.

(Optional) There's a docker-compose ready environment that exposes the 3000 port
```bash
docker-compose up --build
```