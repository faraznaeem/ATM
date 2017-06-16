# The ATM challenge

###Synopsis
This project is the first excercise our cohort have done using Ruby programming language.
The project consists of making a virtual ATM machine, with the interaction from the terminal.


###Motivation
The ATM challenge shows how different parts of a program interact and going through
the basic methods of Ruby.

###Installation
To run the program you need to have a working terminal with irb installed, and download all the files from the ATM-repository

###Running the ATM
To run the virtual ATM you need to enter the irb-mode.

###Steps to initialize the ATM
```
load './lib/atm.rb'
``` 
```
=> true 
````
```

```
load './lib/person.rb'
```
```
=> true 
```


No need to load 

```
'./lib/account.rb'
```

####Create a person (user)
```
person = Person.new({name: 'Faraz'})
```
```
=> #<Person:0x007f9f5199c710 @name="Faraz", @cash=0, @account=nil>
```

####Create an Account
```
account = person.create_account     
```
```
=> #<Account:0x007f9f5198e610 @pin_code="8475", @balance=0, @exp_date="06/22", @account_status=:active, @owner=#<Person:0x007f9f5199c710 @name="Faraz", @cash=0, @account=#<Account:0x007f9f5198e610 ...>>> (please note the pin code)
```


####Create an ATM

```
atm = Atm.new
```

```
=> #<Atm:0x007f9f5197f2c8 @funds=1000> 
```

####Deposit money to the account

```
person.deposit(100)
```

```
 => 100 
```

####Withdraw money from the account

```
person.withdraw({amount:50, account:account, atm:atm, pin:'8475'})
```

(please enter pin code from previous step)

```
=> -50 
```


####Check balance of the account
```
account.balance
```

```
 => 50
```

####Check Balance of the ATM

```
atm.funds
```

```
=> 950 
```
