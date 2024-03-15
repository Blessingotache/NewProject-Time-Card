--==--------------------------------------------------------------------------------------------------------------
--To encrypt credit card number table
-- Add an encrypted column to store the credit card number
ALTER TABLE Payment.Payments
ADD EncryptedCreditCard VARBINARY(MAX);

-- Update existing records with encrypted credit card numbers
UPDATE Payment.Payments
SET EncryptedCreditCard = ENCRYPTBYPASSPHRASE('Agent001hubkad', CreditCardNumber);

-- Remove the original credit card number column
ALTER TABLE Payment.Payments
DROP COLUMN CreditCardNumber;
  


--==--------------------------------------------------------------------------------------------------------------
--To decrypt credit card number table

-- Add a new column to store the decrypted credit card number
ALTER TABLE Payment.Payments
ADD DecryptedCreditCard VARCHAR(30);

-- Update existing records with decrypted credit card numbers
UPDATE Payment.Payments
SET DecryptedCreditCard = CONVERT(VARCHAR(30), DECRYPTBYPASSPHRASE('YourSecretPassphrase', EncryptedCreditCard));

-- Drop the encrypted column as it's no longer needed
ALTER TABLE Payment.Payments
DROP COLUMN EncryptedCreditCard;
