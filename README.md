# Tripadvirsor
Requirements
• Create a new application using a UITabBarController. This tab bar controller will have two tabs: one named “lunch” and one named “internets”.
• For the first tab, “Lunch,” you will create a UICollectionView that will display content from the JSON data feed found at https://s3.amazonaws.com/br-codingexams/restaurants.json
• Design a data model to contain the restaurant objects returned in the JSON feed.
• Fetch the data from the internet asynchronously.
• Display the data in a UICollectionView with custom cells.
• Images for the cell background and restaurant logos are located in URLs found on the model objects in the JSON feed. You should fetch and cache these images asynchronously and display them in the cells.
• Tapping on one of the restaurant cells should push a restaurant detail viewController onto the stack of a UINavigationController. Show restaurant  details and location on the map below details.
• For the second tab, “Internets,” you will create a simple web browser programmatically (in code), without using interface builder, while still using auto-layout to ensure the view displays correctly.
• Upon initial load of your web viewController, display this URL: https://www.tripadvisor.ru/
• Provide support for Back, Next, Refresh functionality as you would see in a full-featured web browser implementation.
• No cocoa pods are allowed. Third party libraries for image fetching and caching are not recommended. We want to see what you can, or cannot, do.
