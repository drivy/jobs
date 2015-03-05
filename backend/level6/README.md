# Level 6

Some users want to modify the dates/distance for a given rental.

They give us the new dates/distance, and we take care of the rest:
- we compute the amount that was already paid by (or given to) each actor (driver/owner/insurance/assistance/drivy)
- using the new dates/distance, we re-compute the price of the rental, the "deductible reduction" amount, the commission, ...
- we compute the delta amount [1] that must be debited/credited for each actor
- each actor receives a debit/credit payment to settle his debt

Compute the delta amounts for each actor.

[1] the delta amount is basically the difference between:
- the amount the actor owes (or is owed) *after* the modification
- the amount the actor has already paid (or been given) *before* the modification
