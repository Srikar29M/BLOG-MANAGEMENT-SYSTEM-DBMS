-- Query 1: Total Number of Comments and Likes per Blog Post
SELECT Post_ID, 
       Number_Of_Comments, 
       Number_Of_Likes
FROM Blog_Post;

-- Query 2: List of Topics with Number of Blog Posts Associated
SELECT t.Topic_Name, 
       COUNT(bp.Post_ID) AS Number_Of_Blog_Posts
FROM Topic t
LEFT JOIN Blog_Post bp ON t.Topic_ID = bp.Topic_ID
GROUP BY t.Topic_Name;

-- Query 3: Recent Blog Posts with Their Page Content
SELECT bp.Post_ID, 
       bp.Date_Created, 
       p.Content AS Page_Content
FROM Blog_Post bp
JOIN Pages p ON bp.Post_ID = p.Post_ID
ORDER BY bp.Date_Created DESC;

-- Query 4: Most Commented Blog Posts
SELECT bp.Post_ID, 
       bp.Date_Created, 
       bp.Number_Of_Comments
FROM Blog_Post bp
ORDER BY bp.Number_Of_Comments DESC
LIMIT 5;

-- Query 5: Total Number of Blog Posts and Comments by Topic
SELECT t.Topic_Name, 
       COUNT(bp.Post_ID) AS Total_Blog_Posts, 
       SUM(bp.Number_Of_Comments) AS Total_Comments
FROM Topic t
LEFT JOIN Blog_Post bp ON t.Topic_ID = bp.Topic_ID
GROUP BY t.Topic_Name;

-- Query 6: Number of Followers per User
SELECT u.UserID, 
       u.EmailID, 
       COUNT(f.FollowerID) AS Number_Of_Followers
FROM User_ u
LEFT JOIN Follower f ON u.UserID = f.UserID
GROUP BY u.UserID, u.EmailID;

-- Query 7: Average Number of Likes per Blog Post by Topic
SELECT t.Topic_Name, 
       AVG(bp.Number_Of_Likes) AS Average_Likes
FROM Topic t
LEFT JOIN Blog_Post bp ON t.Topic_ID = bp.Topic_ID
GROUP BY t.Topic_Name;

