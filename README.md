## Practice Tech Test: Bank Program

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

## User Stories
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
