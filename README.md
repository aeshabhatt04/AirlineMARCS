# AirlineMARCS
This project is an Online Analytical Processing (OLAP) system to enhance the customer experience in booking flights. It leverages Python and SQL Server to manage and analyze large volumes of airline data. Key functionalities include:

**Flight Search and Retrieval:**
Customers can search for flights by providing departure and arrival cities, dates, and a budget. The system retrieves relevant flight information, including available airlines, class of service (e.g., Business, Economy), and flight pricing, with the capability to handle multiple variables like pet travel and alternative airlines.

**Dynamic Reporting:**
The system dynamically displays details such as flight times, durations, available seats, and pricing in Canadian dollars. Itineraries are generated based on selected flights, and PDF copies of itineraries are emailed to customers.

**Advanced Filters and Recommendations:**
It offers intelligent suggestions, such as flights on nearby dates if no flights are found on the chosen date or alternative airlines if the preferred one exceeds the budget. The system can also analyze past flight data to predict flight punctuality and recommend options based on user preferences (e.g., most traveled airlines).

**OLAP Capabilities:**
SQL Server is used to store flight-related data, and Python is utilized to perform analytical queries, ensuring real-time updates for customers. This combination allows for complex reporting on airline ratings, frequent searches, and location-based analytics, providing deeper insights into user behavior and airline performance.

**Administrative Features and Data Security:**
Admins have the ability to manage flight data with specific access levels for reading, writing, and updating information. The system also records detailed analytics on flight searches, clicks, and user interactions, further improving the decision-making process for both customers and the system.

This project showcases a powerful OLAP system that strongly focuses on data management, customer experience, and real-time analytics, built using Python and SQL Server.​
