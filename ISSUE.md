# Ticket 34662: Add the ability to save banking information for companies

## The feature

We want to be able to save banking details for companies that can at a later stage be used to automate transactions such as debits and credits.

## Why?

As we see a larger number of customers sign up on our platform, the 2% comission on each transaction made via Stripe / Razorpay is turning into a major contributor of our red column. We would like to move away from Strip and Razorpay as our payment processors and rely on the new UPI APIs made available to private organisations. The UPI APIs have a fixed cost of INR 5 for transactions upto INR 25,000. By planning our transactions smartly, we should be able to reduce our transaction costs to a negligible amount.

## Primary Goals

1. Give our customers the ability to add banking details to their profiles.
    2. They should be able to do this by logging in to the existing admin panels and heading to the "Business Settings > Payments" page.
    3. A BO (Business Owner) should be able to add as many accounts as they want, but should only have one account set as the "default" at a time. At no time should we have more than one default accounts in the database.
    4. The bank account details need to be validated on the frontend using [these apis](https://good.game). A customer should not be able to save incorrect details.
    5. The bank account details need to be further verified by initiating a test transfer of INR 1 to the account. If delivery of the funds fails, the account should be marked as inactive.
4. Create an algorithm to break our transactions (credits and debits) into chunks no larger than INR 25,000 to optimise transaction costs.
    5. This means an invoice can now have several payments associated with it.
6. A debit request requires explicit approval from the customer every time a transaction is requested. This is acheived via OTP verification.
    7. A series of reminders need to be sent out requesting the customer to approve a debit request once it has been initiated from our end.
        8. If a customer does not approve a transaction request in 48 business hours from initiation, an automatic charge to their credit card should be inititated via Stripe.
        9. As a main street employee, I should be able to enable a fine for charges made via Stripe.

### Banking Details

A "Bank Account" shall constitute the following details:

1. Bank Account Number
2. Account Holder's Name
3. Bank Name
4. Bank Branch Name
5. Bank IFSC Code / SWIFT Code (Depending on the country the business is located in)

## Customer Journey

1. As a customer I should be able to login to my admin panel and add bank account details.
2. As a customer, when I add incorrect details, I should see sensible validation errors.
3. As a customer, I should be able to select a default account.
4. As a customer, when selecting a default account, all other accounts marked as default should be reset to a non-default state, and I should see a warning message confirming the same.
5. As a customer, when I add a new account, I should see it in a "pending verification" state till the backend verification is completed.
6. As a customer, I should not be able to set an account in the "pending verification" state as the default account.
7. As a customer, I should receive notifications on whatsapp and email when a debit request is raised, with reminders and followups.
8. As a Main Street employee, I should be able to switch customers from Stripe to UPI using a setting on the dashboard.
9. As a Main Street employee, I should receive stats on the costs saved because of the switch from Stripe to UPI.

# Success Metrics

We shall measure the following metrics to determine success.

## Baseline
- Average cost incurred per INR 100K credited to customers.
- Average cost incurred per INR 100K charged from customers.
- Success rate of credits
- Success rate of charges

## Metrics

- Change in average cost incurred per INR 100K credited to customers.
- Change in average cost incurred per INR 100K charged from customers.
- Change in success rate of credits
- Change in success rate of charges

## References

- [UPI API docs]()
- [Bank Account Verification APIs]()
- [Statuses for Bank Accounts]()
- [Figma designs for Admin Panel]()
- [List of companies using UPI (examples for inspiration)]()

## Contact

- Aaditya, for any questions relating to financial information data storage compliances. ( aaditya@mainstreet.com )
- Me, for concenrs and questions around designs, UX and otherwise. ( navid@mainstreet.com )