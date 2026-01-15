module RegisteredUser where 

newtype Username = Username String
newtype AccountNumber = AccountNumber Integer

data User = Unregistered 
            | RegisteredUser Username AccountNumber 

printUser :: User -> IO ()
printUser Unregistered = putStrLn "Unregistered User"
printUser (RegisteredUser (Username name)
                          (AccountNumber acctNum))
          = putStrLn $ name ++ " " ++ show acctNum

