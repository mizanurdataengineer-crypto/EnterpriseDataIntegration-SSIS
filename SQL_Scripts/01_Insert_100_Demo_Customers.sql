-- EnterpriseDataIntegration | Step 7.5 | Synthetic customer seed data
-- Demo-only fictional identities; emails use reserved example.com domain.
-- Run AFTER 00_Create_Databases.sql and the Customers table schema script.
-- Does not overwrite or delete existing customers.
-- CustomerID is omitted because the project uses an IDENTITY column.
-- CustomerCode is computed from CustomerID; CUS900xxx source labels are not persisted.
-- Demo rows are identified for repeat runs by their unique synthetic email addresses.
USE EnterpriseERP;
GO

SET NOCOUNT ON;

DECLARE @DemoCustomers TABLE
(
    CustomerCode nvarchar(30) NOT NULL PRIMARY KEY, -- source labels only; not inserted into computed column
    CustomerName nvarchar(150) NOT NULL,
    Email nvarchar(200) NULL,
    Phone nvarchar(30) NULL,
    City nvarchar(100) NULL,
    CustomerType nvarchar(50) NULL,
    CreatedAt datetime2(0) NOT NULL,
    ModifiedAt datetime2(0) NOT NULL,
    IsActive bit NOT NULL
);

INSERT INTO @DemoCustomers
(CustomerCode, CustomerName, Email, Phone, City, CustomerType, CreatedAt, ModifiedAt, IsActive)
VALUES
(N'CUS900001', N'Imran Jahan', N'demo.customer001@example.com', N'01900000001', N'Sylhet', N'Retail', CAST('2026-02-02T09:30:00' AS datetime2(0)), CAST('2026-02-02T09:30:00' AS datetime2(0)), 1),
(N'CUS900002', N'Nayeem Hossain', N'demo.customer002@example.com', N'01900000002', N'Barishal', N'Retail', CAST('2026-03-03T09:30:00' AS datetime2(0)), CAST('2026-03-03T09:30:00' AS datetime2(0)), 1),
(N'CUS900003', N'Farzana Khan', N'demo.customer003@example.com', N'01900000003', N'Gazipur', N'Retail', CAST('2026-04-04T09:30:00' AS datetime2(0)), CAST('2026-04-04T09:30:00' AS datetime2(0)), 1),
(N'CUS900004', N'Maliha Chowdhury', N'demo.customer004@example.com', N'01900000004', N'Bogura', N'Retail', CAST('2026-05-05T09:30:00' AS datetime2(0)), CAST('2026-05-05T09:30:00' AS datetime2(0)), 1),
(N'CUS900005', N'Faria Sarker', N'demo.customer005@example.com', N'01900000005', N'Coxs Bazar', N'Corporate', CAST('2026-06-06T09:30:00' AS datetime2(0)), CAST('2026-06-06T09:30:00' AS datetime2(0)), 1),
(N'CUS900006', N'Mahmud Mahmud', N'demo.customer006@example.com', N'01900000006', N'Kushtia', N'Retail', CAST('2026-07-07T09:30:00' AS datetime2(0)), CAST('2026-07-07T09:30:00' AS datetime2(0)), 1),
(N'CUS900007', N'Hasan Haque', N'demo.customer007@example.com', N'01900000007', N'Chattogram', N'Retail', CAST('2026-08-08T09:30:00' AS datetime2(0)), CAST('2026-08-08T09:30:00' AS datetime2(0)), 1),
(N'CUS900008', N'Mehedi Hasan', N'demo.customer008@example.com', N'01900000008', N'Rajshahi', N'Retail', CAST('2026-09-09T09:30:00' AS datetime2(0)), CAST('2026-09-09T09:30:00' AS datetime2(0)), 1),
(N'CUS900009', N'Tasnim Uddin', N'demo.customer009@example.com', N'01900000009', N'Mymensingh', N'Retail', CAST('2026-10-10T09:30:00' AS datetime2(0)), CAST('2026-10-10T09:30:00' AS datetime2(0)), 1),
(N'CUS900010', N'Sharmin Sultana', N'demo.customer010@example.com', N'01900000010', N'Jashore', N'Corporate', CAST('2026-01-11T09:30:00' AS datetime2(0)), CAST('2026-01-11T09:30:00' AS datetime2(0)), 1),
(N'CUS900011', N'Tanjina Rahman', N'demo.customer011@example.com', N'01900000011', N'Feni', N'Retail', CAST('2026-02-12T09:30:00' AS datetime2(0)), CAST('2026-02-12T09:30:00' AS datetime2(0)), 1),
(N'CUS900012', N'Sabbir Begum', N'demo.customer012@example.com', N'01900000012', N'Pabna', N'Retail', CAST('2026-03-13T09:30:00' AS datetime2(0)), CAST('2026-03-13T09:30:00' AS datetime2(0)), 1),
(N'CUS900013', N'Shakil Islam', N'demo.customer013@example.com', N'01900000013', N'Dhaka', N'Retail', CAST('2026-04-14T09:30:00' AS datetime2(0)), CAST('2026-04-14T09:30:00' AS datetime2(0)), 1),
(N'CUS900014', N'Zahid Miah', N'demo.customer014@example.com', N'01900000014', N'Sylhet', N'Retail', CAST('2026-05-15T09:30:00' AS datetime2(0)), CAST('2026-05-15T09:30:00' AS datetime2(0)), 1),
(N'CUS900015', N'Jannat Karim', N'demo.customer015@example.com', N'01900000015', N'Barishal', N'Corporate', CAST('2026-06-16T09:30:00' AS datetime2(0)), CAST('2026-06-16T09:30:00' AS datetime2(0)), 1),
(N'CUS900016', N'Samira Alam', N'demo.customer016@example.com', N'01900000016', N'Gazipur', N'Retail', CAST('2026-07-17T09:30:00' AS datetime2(0)), CAST('2026-07-17T09:30:00' AS datetime2(0)), 1),
(N'CUS900017', N'Ayesha Kabir', N'demo.customer017@example.com', N'01900000017', N'Bogura', N'Retail', CAST('2026-08-18T09:30:00' AS datetime2(0)), CAST('2026-08-18T09:30:00' AS datetime2(0)), 1),
(N'CUS900018', N'Rafiq Siddique', N'demo.customer018@example.com', N'01900000018', N'Dinajpur', N'Retail', CAST('2026-09-19T09:30:00' AS datetime2(0)), CAST('2026-09-19T09:30:00' AS datetime2(0)), 1),
(N'CUS900019', N'Tariq Akter', N'demo.customer019@example.com', N'01900000019', N'Tangail', N'Retail', CAST('2026-10-20T09:30:00' AS datetime2(0)), CAST('2026-10-20T09:30:00' AS datetime2(0)), 1),
(N'CUS900020', N'Nusrat Rahman', N'demo.customer020@example.com', N'01900000020', N'Cumilla', N'Corporate', CAST('2026-01-21T09:30:00' AS datetime2(0)), CAST('2026-01-21T09:30:00' AS datetime2(0)), 1),
(N'CUS900021', N'Rumana Begum', N'demo.customer021@example.com', N'01900000021', N'Khulna', N'Retail', CAST('2026-02-22T09:30:00' AS datetime2(0)), CAST('2026-02-22T09:30:00' AS datetime2(0)), 1),
(N'CUS900022', N'Raisa Islam', N'demo.customer022@example.com', N'01900000022', N'Mymensingh', N'Retail', CAST('2026-03-23T09:30:00' AS datetime2(0)), CAST('2026-03-23T09:30:00' AS datetime2(0)), 1),
(N'CUS900023', N'Tanvir Miah', N'demo.customer023@example.com', N'01900000023', N'Jashore', N'Retail', CAST('2026-04-24T09:30:00' AS datetime2(0)), CAST('2026-04-24T09:30:00' AS datetime2(0)), 1),
(N'CUS900024', N'Rakib Karim', N'demo.customer024@example.com', N'01900000024', N'Feni', N'Retail', CAST('2026-05-25T09:30:00' AS datetime2(0)), CAST('2026-05-25T09:30:00' AS datetime2(0)), 1),
(N'CUS900025', N'Rashed Alam', N'demo.customer025@example.com', N'01900000025', N'Pabna', N'Corporate', CAST('2026-06-26T09:30:00' AS datetime2(0)), CAST('2026-06-26T09:30:00' AS datetime2(0)), 1),
(N'CUS900026', N'Sadia Kabir', N'demo.customer026@example.com', N'01900000026', N'Dhaka', N'Retail', CAST('2026-07-27T09:30:00' AS datetime2(0)), CAST('2026-07-27T09:30:00' AS datetime2(0)), 1),
(N'CUS900027', N'Tahmina Siddique', N'demo.customer027@example.com', N'01900000027', N'Rajshahi', N'Retail', CAST('2026-08-01T09:30:00' AS datetime2(0)), CAST('2026-08-01T09:30:00' AS datetime2(0)), 1),
(N'CUS900028', N'Ishrat Akter', N'demo.customer028@example.com', N'01900000028', N'Rangpur', N'Retail', CAST('2026-09-02T09:30:00' AS datetime2(0)), CAST('2026-09-02T09:30:00' AS datetime2(0)), 1),
(N'CUS900029', N'Arif Ahmed', N'demo.customer029@example.com', N'01900000029', N'Narayanganj', N'Retail', CAST('2026-10-03T09:30:00' AS datetime2(0)), CAST('2026-10-03T09:30:00' AS datetime2(0)), 1),
(N'CUS900030', N'Sajid Jahan', N'demo.customer030@example.com', N'01900000030', N'Noakhali', N'Corporate', CAST('2026-01-04T09:30:00' AS datetime2(0)), CAST('2026-01-04T09:30:00' AS datetime2(0)), 1),
(N'CUS900031', N'Adnan Hossain', N'demo.customer031@example.com', N'01900000031', N'Dinajpur', N'Retail', CAST('2026-02-05T09:30:00' AS datetime2(0)), CAST('2026-02-05T09:30:00' AS datetime2(0)), 1),
(N'CUS900032', N'Sumaiya Khan', N'demo.customer032@example.com', N'01900000032', N'Tangail', N'Retail', CAST('2026-03-06T09:30:00' AS datetime2(0)), CAST('2026-03-06T09:30:00' AS datetime2(0)), 1),
(N'CUS900033', N'Afrin Chowdhury', N'demo.customer033@example.com', N'01900000033', N'Cumilla', N'Retail', CAST('2026-04-07T09:30:00' AS datetime2(0)), CAST('2026-04-07T09:30:00' AS datetime2(0)), 1),
(N'CUS900034', N'Nishat Sarker', N'demo.customer034@example.com', N'01900000034', N'Khulna', N'Retail', CAST('2026-05-08T09:30:00' AS datetime2(0)), CAST('2026-05-08T09:30:00' AS datetime2(0)), 1),
(N'CUS900035', N'Nafis Mahmud', N'demo.customer035@example.com', N'01900000035', N'Mymensingh', N'Corporate', CAST('2026-06-09T09:30:00' AS datetime2(0)), CAST('2026-06-09T09:30:00' AS datetime2(0)), 1),
(N'CUS900036', N'Farhan Haque', N'demo.customer036@example.com', N'01900000036', N'Bogura', N'Retail', CAST('2026-07-10T09:30:00' AS datetime2(0)), CAST('2026-07-10T09:30:00' AS datetime2(0)), 1),
(N'CUS900037', N'Sohail Hasan', N'demo.customer037@example.com', N'01900000037', N'Coxs Bazar', N'Retail', CAST('2026-08-11T09:30:00' AS datetime2(0)), CAST('2026-08-11T09:30:00' AS datetime2(0)), 1),
(N'CUS900038', N'Nabila Uddin', N'demo.customer038@example.com', N'01900000038', N'Kushtia', N'Retail', CAST('2026-09-12T09:30:00' AS datetime2(0)), CAST('2026-09-12T09:30:00' AS datetime2(0)), 1),
(N'CUS900039', N'Mim Sultana', N'demo.customer039@example.com', N'01900000039', N'Chattogram', N'Retail', CAST('2026-10-13T09:30:00' AS datetime2(0)), CAST('2026-10-13T09:30:00' AS datetime2(0)), 1),
(N'CUS900040', N'Fahim Hossain', N'demo.customer040@example.com', N'01900000040', N'Rajshahi', N'Corporate', CAST('2026-01-14T09:30:00' AS datetime2(0)), CAST('2026-01-14T09:30:00' AS datetime2(0)), 1),
(N'CUS900041', N'Imran Khan', N'demo.customer041@example.com', N'01900000041', N'Rangpur', N'Retail', CAST('2026-02-15T09:30:00' AS datetime2(0)), CAST('2026-02-15T09:30:00' AS datetime2(0)), 1),
(N'CUS900042', N'Nayeem Chowdhury', N'demo.customer042@example.com', N'01900000042', N'Narayanganj', N'Retail', CAST('2026-03-16T09:30:00' AS datetime2(0)), CAST('2026-03-16T09:30:00' AS datetime2(0)), 1),
(N'CUS900043', N'Farzana Sarker', N'demo.customer043@example.com', N'01900000043', N'Noakhali', N'Retail', CAST('2026-04-17T09:30:00' AS datetime2(0)), CAST('2026-04-17T09:30:00' AS datetime2(0)), 1),
(N'CUS900044', N'Maliha Mahmud', N'demo.customer044@example.com', N'01900000044', N'Dinajpur', N'Retail', CAST('2026-05-18T09:30:00' AS datetime2(0)), CAST('2026-05-18T09:30:00' AS datetime2(0)), 1),
(N'CUS900045', N'Faria Haque', N'demo.customer045@example.com', N'01900000045', N'Dhaka', N'Corporate', CAST('2026-06-19T09:30:00' AS datetime2(0)), CAST('2026-06-19T09:30:00' AS datetime2(0)), 1),
(N'CUS900046', N'Mahmud Hasan', N'demo.customer046@example.com', N'01900000046', N'Sylhet', N'Retail', CAST('2026-07-20T09:30:00' AS datetime2(0)), CAST('2026-07-20T09:30:00' AS datetime2(0)), 1),
(N'CUS900047', N'Hasan Uddin', N'demo.customer047@example.com', N'01900000047', N'Barishal', N'Retail', CAST('2026-08-21T09:30:00' AS datetime2(0)), CAST('2026-08-21T09:30:00' AS datetime2(0)), 1),
(N'CUS900048', N'Mehedi Sultana', N'demo.customer048@example.com', N'01900000048', N'Gazipur', N'Retail', CAST('2026-09-22T09:30:00' AS datetime2(0)), CAST('2026-09-22T09:30:00' AS datetime2(0)), 1),
(N'CUS900049', N'Tasnim Rahman', N'demo.customer049@example.com', N'01900000049', N'Bogura', N'Retail', CAST('2026-10-23T09:30:00' AS datetime2(0)), CAST('2026-10-23T09:30:00' AS datetime2(0)), 1),
(N'CUS900050', N'Sharmin Begum', N'demo.customer050@example.com', N'01900000050', N'Coxs Bazar', N'Corporate', CAST('2026-01-24T09:30:00' AS datetime2(0)), CAST('2026-01-24T09:30:00' AS datetime2(0)), 1),
(N'CUS900051', N'Tanjina Islam', N'demo.customer051@example.com', N'01900000051', N'Kushtia', N'Retail', CAST('2026-02-25T09:30:00' AS datetime2(0)), CAST('2026-02-25T09:30:00' AS datetime2(0)), 1),
(N'CUS900052', N'Sabbir Miah', N'demo.customer052@example.com', N'01900000052', N'Chattogram', N'Retail', CAST('2026-03-26T09:30:00' AS datetime2(0)), CAST('2026-03-26T09:30:00' AS datetime2(0)), 1),
(N'CUS900053', N'Shakil Karim', N'demo.customer053@example.com', N'01900000053', N'Rajshahi', N'Retail', CAST('2026-04-27T09:30:00' AS datetime2(0)), CAST('2026-04-27T09:30:00' AS datetime2(0)), 1),
(N'CUS900054', N'Zahid Alam', N'demo.customer054@example.com', N'01900000054', N'Mymensingh', N'Retail', CAST('2026-05-01T09:30:00' AS datetime2(0)), CAST('2026-05-01T09:30:00' AS datetime2(0)), 1),
(N'CUS900055', N'Jannat Kabir', N'demo.customer055@example.com', N'01900000055', N'Jashore', N'Corporate', CAST('2026-06-02T09:30:00' AS datetime2(0)), CAST('2026-06-02T09:30:00' AS datetime2(0)), 1),
(N'CUS900056', N'Samira Siddique', N'demo.customer056@example.com', N'01900000056', N'Feni', N'Retail', CAST('2026-07-03T09:30:00' AS datetime2(0)), CAST('2026-07-03T09:30:00' AS datetime2(0)), 1),
(N'CUS900057', N'Ayesha Akter', N'demo.customer057@example.com', N'01900000057', N'Pabna', N'Retail', CAST('2026-08-04T09:30:00' AS datetime2(0)), CAST('2026-08-04T09:30:00' AS datetime2(0)), 1),
(N'CUS900058', N'Rafiq Ahmed', N'demo.customer058@example.com', N'01900000058', N'Dhaka', N'Retail', CAST('2026-09-05T09:30:00' AS datetime2(0)), CAST('2026-09-05T09:30:00' AS datetime2(0)), 1),
(N'CUS900059', N'Tariq Jahan', N'demo.customer059@example.com', N'01900000059', N'Sylhet', N'Retail', CAST('2026-10-06T09:30:00' AS datetime2(0)), CAST('2026-10-06T09:30:00' AS datetime2(0)), 1),
(N'CUS900060', N'Nusrat Islam', N'demo.customer060@example.com', N'01900000060', N'Barishal', N'Corporate', CAST('2026-01-07T09:30:00' AS datetime2(0)), CAST('2026-01-07T09:30:00' AS datetime2(0)), 1),
(N'CUS900061', N'Rumana Miah', N'demo.customer061@example.com', N'01900000061', N'Gazipur', N'Retail', CAST('2026-02-08T09:30:00' AS datetime2(0)), CAST('2026-02-08T09:30:00' AS datetime2(0)), 1),
(N'CUS900062', N'Raisa Karim', N'demo.customer062@example.com', N'01900000062', N'Bogura', N'Retail', CAST('2026-03-09T09:30:00' AS datetime2(0)), CAST('2026-03-09T09:30:00' AS datetime2(0)), 1),
(N'CUS900063', N'Tanvir Alam', N'demo.customer063@example.com', N'01900000063', N'Dinajpur', N'Retail', CAST('2026-04-10T09:30:00' AS datetime2(0)), CAST('2026-04-10T09:30:00' AS datetime2(0)), 1),
(N'CUS900064', N'Rakib Kabir', N'demo.customer064@example.com', N'01900000064', N'Tangail', N'Retail', CAST('2026-05-11T09:30:00' AS datetime2(0)), CAST('2026-05-11T09:30:00' AS datetime2(0)), 1),
(N'CUS900065', N'Rashed Siddique', N'demo.customer065@example.com', N'01900000065', N'Cumilla', N'Corporate', CAST('2026-06-12T09:30:00' AS datetime2(0)), CAST('2026-06-12T09:30:00' AS datetime2(0)), 1),
(N'CUS900066', N'Sadia Akter', N'demo.customer066@example.com', N'01900000066', N'Khulna', N'Retail', CAST('2026-07-13T09:30:00' AS datetime2(0)), CAST('2026-07-13T09:30:00' AS datetime2(0)), 1),
(N'CUS900067', N'Tahmina Ahmed', N'demo.customer067@example.com', N'01900000067', N'Mymensingh', N'Retail', CAST('2026-08-14T09:30:00' AS datetime2(0)), CAST('2026-08-14T09:30:00' AS datetime2(0)), 1),
(N'CUS900068', N'Ishrat Jahan', N'demo.customer068@example.com', N'01900000068', N'Jashore', N'Retail', CAST('2026-09-15T09:30:00' AS datetime2(0)), CAST('2026-09-15T09:30:00' AS datetime2(0)), 1),
(N'CUS900069', N'Arif Hossain', N'demo.customer069@example.com', N'01900000069', N'Feni', N'Retail', CAST('2026-10-16T09:30:00' AS datetime2(0)), CAST('2026-10-16T09:30:00' AS datetime2(0)), 1),
(N'CUS900070', N'Sajid Khan', N'demo.customer070@example.com', N'01900000070', N'Pabna', N'Corporate', CAST('2026-01-17T09:30:00' AS datetime2(0)), CAST('2026-01-17T09:30:00' AS datetime2(0)), 1),
(N'CUS900071', N'Adnan Chowdhury', N'demo.customer071@example.com', N'01900000071', N'Dhaka', N'Retail', CAST('2026-02-18T09:30:00' AS datetime2(0)), CAST('2026-02-18T09:30:00' AS datetime2(0)), 1),
(N'CUS900072', N'Sumaiya Sarker', N'demo.customer072@example.com', N'01900000072', N'Rajshahi', N'Retail', CAST('2026-03-19T09:30:00' AS datetime2(0)), CAST('2026-03-19T09:30:00' AS datetime2(0)), 1),
(N'CUS900073', N'Afrin Mahmud', N'demo.customer073@example.com', N'01900000073', N'Rangpur', N'Retail', CAST('2026-04-20T09:30:00' AS datetime2(0)), CAST('2026-04-20T09:30:00' AS datetime2(0)), 1),
(N'CUS900074', N'Nishat Haque', N'demo.customer074@example.com', N'01900000074', N'Narayanganj', N'Retail', CAST('2026-05-21T09:30:00' AS datetime2(0)), CAST('2026-05-21T09:30:00' AS datetime2(0)), 1),
(N'CUS900075', N'Nafis Hasan', N'demo.customer075@example.com', N'01900000075', N'Noakhali', N'Corporate', CAST('2026-06-22T09:30:00' AS datetime2(0)), CAST('2026-06-22T09:30:00' AS datetime2(0)), 1),
(N'CUS900076', N'Farhan Uddin', N'demo.customer076@example.com', N'01900000076', N'Dinajpur', N'Retail', CAST('2026-07-23T09:30:00' AS datetime2(0)), CAST('2026-07-23T09:30:00' AS datetime2(0)), 1),
(N'CUS900077', N'Sohail Sultana', N'demo.customer077@example.com', N'01900000077', N'Tangail', N'Retail', CAST('2026-08-24T09:30:00' AS datetime2(0)), CAST('2026-08-24T09:30:00' AS datetime2(0)), 1),
(N'CUS900078', N'Nabila Rahman', N'demo.customer078@example.com', N'01900000078', N'Cumilla', N'Retail', CAST('2026-09-25T09:30:00' AS datetime2(0)), CAST('2026-09-25T09:30:00' AS datetime2(0)), 1),
(N'CUS900079', N'Mim Begum', N'demo.customer079@example.com', N'01900000079', N'Khulna', N'Retail', CAST('2026-10-26T09:30:00' AS datetime2(0)), CAST('2026-10-26T09:30:00' AS datetime2(0)), 1),
(N'CUS900080', N'Fahim Chowdhury', N'demo.customer080@example.com', N'01900000080', N'Mymensingh', N'Corporate', CAST('2026-01-27T09:30:00' AS datetime2(0)), CAST('2026-01-27T09:30:00' AS datetime2(0)), 1),
(N'CUS900081', N'Imran Sarker', N'demo.customer081@example.com', N'01900000081', N'Bogura', N'Retail', CAST('2026-02-01T09:30:00' AS datetime2(0)), CAST('2026-02-01T09:30:00' AS datetime2(0)), 1),
(N'CUS900082', N'Nayeem Mahmud', N'demo.customer082@example.com', N'01900000082', N'Coxs Bazar', N'Retail', CAST('2026-03-02T09:30:00' AS datetime2(0)), CAST('2026-03-02T09:30:00' AS datetime2(0)), 1),
(N'CUS900083', N'Farzana Haque', N'demo.customer083@example.com', N'01900000083', N'Kushtia', N'Retail', CAST('2026-04-03T09:30:00' AS datetime2(0)), CAST('2026-04-03T09:30:00' AS datetime2(0)), 1),
(N'CUS900084', N'Maliha Hasan', N'demo.customer084@example.com', N'01900000084', N'Chattogram', N'Retail', CAST('2026-05-04T09:30:00' AS datetime2(0)), CAST('2026-05-04T09:30:00' AS datetime2(0)), 1),
(N'CUS900085', N'Faria Uddin', N'demo.customer085@example.com', N'01900000085', N'Rajshahi', N'Corporate', CAST('2026-06-05T09:30:00' AS datetime2(0)), CAST('2026-06-05T09:30:00' AS datetime2(0)), 1),
(N'CUS900086', N'Mahmud Sultana', N'demo.customer086@example.com', N'01900000086', N'Rangpur', N'Retail', CAST('2026-07-06T09:30:00' AS datetime2(0)), CAST('2026-07-06T09:30:00' AS datetime2(0)), 1),
(N'CUS900087', N'Hasan Rahman', N'demo.customer087@example.com', N'01900000087', N'Narayanganj', N'Retail', CAST('2026-08-07T09:30:00' AS datetime2(0)), CAST('2026-08-07T09:30:00' AS datetime2(0)), 1),
(N'CUS900088', N'Mehedi Begum', N'demo.customer088@example.com', N'01900000088', N'Noakhali', N'Retail', CAST('2026-09-08T09:30:00' AS datetime2(0)), CAST('2026-09-08T09:30:00' AS datetime2(0)), 1),
(N'CUS900089', N'Tasnim Islam', N'demo.customer089@example.com', N'01900000089', N'Dinajpur', N'Retail', CAST('2026-10-09T09:30:00' AS datetime2(0)), CAST('2026-10-09T09:30:00' AS datetime2(0)), 1),
(N'CUS900090', N'Sharmin Miah', N'demo.customer090@example.com', N'01900000090', N'Dhaka', N'Corporate', CAST('2026-01-10T09:30:00' AS datetime2(0)), CAST('2026-01-10T09:30:00' AS datetime2(0)), 1),
(N'CUS900091', N'Tanjina Karim', N'demo.customer091@example.com', N'01900000091', N'Sylhet', N'Retail', CAST('2026-02-11T09:30:00' AS datetime2(0)), CAST('2026-02-11T09:30:00' AS datetime2(0)), 1),
(N'CUS900092', N'Sabbir Alam', N'demo.customer092@example.com', N'01900000092', N'Barishal', N'Retail', CAST('2026-03-12T09:30:00' AS datetime2(0)), CAST('2026-03-12T09:30:00' AS datetime2(0)), 1),
(N'CUS900093', N'Shakil Kabir', N'demo.customer093@example.com', N'01900000093', N'Gazipur', N'Retail', CAST('2026-04-13T09:30:00' AS datetime2(0)), CAST('2026-04-13T09:30:00' AS datetime2(0)), 1),
(N'CUS900094', N'Zahid Siddique', N'demo.customer094@example.com', N'01900000094', N'Bogura', N'Retail', CAST('2026-05-14T09:30:00' AS datetime2(0)), CAST('2026-05-14T09:30:00' AS datetime2(0)), 1),
(N'CUS900095', N'Jannat Akter', N'demo.customer095@example.com', N'01900000095', N'Coxs Bazar', N'Corporate', CAST('2026-06-15T09:30:00' AS datetime2(0)), CAST('2026-06-15T09:30:00' AS datetime2(0)), 1),
(N'CUS900096', N'Samira Ahmed', N'demo.customer096@example.com', N'01900000096', N'Kushtia', N'Retail', CAST('2026-07-16T09:30:00' AS datetime2(0)), CAST('2026-07-16T09:30:00' AS datetime2(0)), 1),
(N'CUS900097', N'Ayesha Jahan', N'demo.customer097@example.com', N'01900000097', N'Chattogram', N'Retail', CAST('2026-08-17T09:30:00' AS datetime2(0)), CAST('2026-08-17T09:30:00' AS datetime2(0)), 1),
(N'CUS900098', N'Rafiq Hossain', N'demo.customer098@example.com', N'01900000098', N'Rajshahi', N'Retail', CAST('2026-09-18T09:30:00' AS datetime2(0)), CAST('2026-09-18T09:30:00' AS datetime2(0)), 1),
(N'CUS900099', N'Tariq Khan', N'demo.customer099@example.com', N'01900000099', N'Mymensingh', N'Retail', CAST('2026-10-19T09:30:00' AS datetime2(0)), CAST('2026-10-19T09:30:00' AS datetime2(0)), 1),
(N'CUS900100', N'Nusrat Karim', N'demo.customer100@example.com', N'01900000100', N'Jashore', N'Corporate', CAST('2026-01-20T09:30:00' AS datetime2(0)), CAST('2026-01-20T09:30:00' AS datetime2(0)), 1);

-- CustomerCode is computed from the IDENTITY CustomerID; never insert it directly.
-- Use the reserved demo email addresses as stable seed keys, regardless of identity gaps.
INSERT INTO dbo.Customers
(CustomerName, Email, Phone, City, CustomerType, CreatedAt, ModifiedAt, IsActive)
SELECT d.CustomerName, d.Email, d.Phone, d.City,
       d.CustomerType, d.CreatedAt, d.ModifiedAt, d.IsActive
FROM @DemoCustomers AS d
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Customers AS c WITH (UPDLOCK, HOLDLOCK)
    WHERE c.Email = d.Email
);

SELECT @@ROWCOUNT AS RowsInserted;
SELECT COUNT(*) AS DemoCustomersPresent
FROM dbo.Customers
WHERE Email LIKE 'demo.customer[0-9][0-9][0-9]@example.com';
GO
