module Test.MySolutions where

import Prelude
import Data.Maybe (Maybe)
import Data.List (head, filter, null, nubByEq)
import Data.AddressBook(AddressBook, Entry)

-- Note to reader: Add your solutions to this file

findEntryByStreet :: String -> AddressBook -> Maybe Entry
findEntryByStreet street = head <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry = _.address.street >>> (==) street

isInBook :: String -> String-> AddressBook -> Boolean
isInBook firstName lastName = not null <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubByEq eqEntry
  where
    eqEntry :: Entry -> Entry -> Boolean
    eqEntry a b = a.firstName == b.firstName && a.lastName == b.lastName
