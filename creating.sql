-- Create the database
CREATE DATABASE blogmanagement;
USE blogmanagement;

-- Create UserName table
CREATE TABLE UserName (
    NameID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL
);

-- Create UserAddress table
CREATE TABLE UserAddress (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    HNo VARCHAR(50),
    Country VARCHAR(50),
    Colony VARCHAR(100),
    State VARCHAR(50)
);

-- Create User_ table
CREATE TABLE User_ (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    MobileNumber VARCHAR(15) NOT NULL UNIQUE,
    DOB DATE,
    EmailID VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    NameID INT,
    AddressID INT,
    FOREIGN KEY (NameID) REFERENCES UserName(NameID),
    FOREIGN KEY (AddressID) REFERENCES UserAddress(AddressID)
);

-- Create Messages table
CREATE TABLE Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    DateSent DATETIME DEFAULT CURRENT_TIMESTAMP,
    Subject VARCHAR(255)
);

-- Create Follower table
CREATE TABLE Follower (
    FollowerID INT AUTO_INCREMENT PRIMARY KEY,
    FollowerUserID INT,
    UserID INT,
    FOREIGN KEY (FollowerUserID) REFERENCES User_(UserID),
    FOREIGN KEY (UserID) REFERENCES User_(UserID)
);

-- Create Polls table
CREATE TABLE Polls (
    Poll_ID INT AUTO_INCREMENT PRIMARY KEY,
    Poll_Question TEXT NOT NULL,
    Creation_Date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Poll_Options table
CREATE TABLE Poll_Options (
    Option_ID INT AUTO_INCREMENT PRIMARY KEY,
    Poll_ID INT,
    Option_Text VARCHAR(255) NOT NULL,
    Vote_Count INT DEFAULT 0,
    FOREIGN KEY (Poll_ID) REFERENCES Polls(Poll_ID)
);

-- Create Comment table
CREATE TABLE Comment (
    Comment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Comment_Content TEXT NOT NULL,
    Date_Commented DATETIME DEFAULT CURRENT_TIMESTAMP,
    Post_ID INT,  -- Adding Post_ID to link with Blog_Post table
    FOREIGN KEY (Post_ID) REFERENCES Blog_Post(Post_ID)
);

-- Create Topic table
CREATE TABLE Topic (
    Topic_ID INT AUTO_INCREMENT PRIMARY KEY,
    Topic_Name VARCHAR(100) NOT NULL
);

-- Create Blog_Post table
CREATE TABLE Blog_Post (
    Post_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date_Created DATETIME DEFAULT CURRENT_TIMESTAMP,
    Number_Of_Comments INT DEFAULT 0,
    Number_Of_Likes INT DEFAULT 0,
    Topic_ID INT,  -- Adding Topic_ID to link with Topic table
    FOREIGN KEY (Topic_ID) REFERENCES Topic(Topic_ID)
);

-- Create Pages table
CREATE TABLE Pages (
    Page_ID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    Date_Modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Post_ID INT,  -- Adding Post_ID to link with Blog_Post table
    FOREIGN KEY (Post_ID) REFERENCES Blog_Post(Post_ID)
);
