## Practice Tech Test: Bank Program [![Coverage Status](https://coveralls.io/repos/github/rkclark/bank-tech-test/badge.svg?branch=master)](https://coveralls.io/github/rkclark/bank-tech-test?branch=master) [![Build Status](https://travis-ci.org/rkclark/bank-tech-test.svg?branch=master)](https://travis-ci.org/rkclark/bank-tech-test)

This project is a practice technical test to build a simple banking program, as per the specification below.

## Specification

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

## My Approach

I decided to complete this project in Ruby.

My first step was to define the following user stories:

```
As a bank client,
I want to be able to create a bank account,
So that I can use the services of the bank
```

```
As a bank client,
I want to be able to deposit monies into my account,
So that my money is stored safely
```

```
As a bank client,
I want to be able to withdraw monies from my account,
So that I can access my money
```

```
As a bank client,
I want to be able to view an account statement,
So I can monitor the status of my account
```

I then designed the following Domain Model using [Ardoq](https://ardoq.com/):

![Domain Model](https://raw.githubusercontent.com/rkclark/bank-tech-test/master/img/domain_model.png)

Next I followed a TDDD approach to implement the required features according to my design and the specification.

### Installation and Usage

To install the program, complete the following:

- Clone this repo
- Run `cd bank-tech-test`
- Run `bundle install`

To run the tests:

- Run `rspec`

To use the program:

- Run `pry`

Pry will initialize an account for you in the `account` variable, and a statement printer in the `sp` variable. Here is an example usage:

```
>> t1 = Transaction.new(amount: 1000.99)

>> account.add_transaction(t1)

>> t2 = Transaction.new(amount:-500)

>> account.add_transaction(t2)

>> t3 = Transaction.new(amount: 0.50)

>> account.add_transaction(t3)

>> sp.print_out(account)
date       || credit || debit   || balance
07/03/2017 ||    0.50||         ||  501.49
07/03/2017 ||        || 500.00  ||  500.99
07/03/2017 || 1000.99||         || 1000.99

```
