# Anxiatude: iOS App for Managing Anxiety

## App Design Screens
#### [Video Demo on Youtube](https://youtu.be/5H-BRae7C04)

| **App Icon**       | **Launch Screen**  | **List Categories** | **Loading View**  | **Detail Category** | **TnC Screen**   |
|--------------------|--------------------|---------------------|-------------------|---------------------|------------------|
| <img width="201" height="437" alt="1  icon" src="https://github.com/user-attachments/assets/aeb2be2e-675e-45cb-af13-48c2cd734977" /> |<img width="201" height="437" alt="2  launch" src="https://github.com/user-attachments/assets/e8249eef-dbfd-4d48-a032-272c698700bb" />  |<img width="201" height="437" alt="3  list" src="https://github.com/user-attachments/assets/2a0694f4-4337-4176-b96f-44364bf12f02" /> |<img width="201" height="437" alt="4  loading" src="https://github.com/user-attachments/assets/2a536e3b-be55-4d17-8ec3-21cd6857cfb2" />| <img width="201" height="437" alt="5  detail" src="https://github.com/user-attachments/assets/45785dc8-2d4d-4fed-a0cc-a6278de9de3f" /> | <img width="201" height="437" alt="6  tnc" src="https://github.com/user-attachments/assets/dde0b2a0-841b-4127-835b-45883661b82d" /> |

## Description

Anxiatude is a purpose-built iOS application meticulously designed to assist users in managing and alleviating anxiety through a curated collection of mindfulness techniques, uplifting positive affirmations, and timeless spiritual wisdom. Developed natively using Apple's modern Swift programming language and the declarative SwiftUI framework, the app delivers a seamless and intuitive user experience. It organizes its therapeutic content into distinct, focused categories, each targeting a different aspect of mental well-being, such as inspirational quotes, guided breathing exercises, and suggested relaxation activities.

Under the hood, the app leverages the powerful Combine framework for efficient and reactive data handling and utilizes URLSession for robust and reliable networking operations. Most importantly, the entire codebase is constructed following the principles of Clean Architecture, a decision that rigorously enforces a separation of concerns. This architectural choice ensures the project remains highly scalable, easily testable, and maintainable over the long term, allowing for future feature additions with minimal friction.

The application's code is logically separated into three primary architectural layers: the **Data** layer, the **Domain** layer, and the **Presentation** layer. Each of these layers has a specific and well-defined role, handling everything from low-level networking and data persistence to core business logic and finally, UI presentation.

## Categories

The app features the following thoughtfully curated categories:

- **Affirm**: Supplies powerful positive affirmations to build self-confidence and empowerment.
- **Anchor**: Delivers grounded and resilient Stoic quotes to promote mental fortitude.
- **Breath**: Offers calming and mindful quotes to center oneself during breathing exercises.
- **Faith**: Shares uplifting Bible verses to provide hope and spiritual comfort.
- **Kindness**: Features motivational and kind quotes to encourage positivity and self-compassion.
- **Reset**: Provides suggestions for simple relaxation activities or DIY projects to break cycles of anxiety.

The app dynamically fetches all its content directly from a set of external, public APIs, presenting this data to the user through a responsive and dynamic interface built on the smooth Model-View-ViewModel (MVVM) design pattern. While many of the APIs did not natively support secure HTTPS connections, a significant development challenge, the app incorporates a built-in security mechanism through SSL pinning to protect user data and network integrity during transmission.

## API Endpoints

1. **Affirm (Affirmations API)**
    - **Endpoint**: [https://www.affirmations.dev](https://www.affirmations.dev)
    - **Description**: A straightforward API that provides a single random positive affirmation. These statements are designed to combat negative self-talk and help users build confidence and self-empowerment through repeated, positive reinforcement.

2. **Anchor (Stoic Quotes API)**
    - **Endpoint**: [https://stoic-quotes.com/api/quote](https://stoic-quotes.com/api/quote)
    - **Description**: This API fetches a random quote from ancient Stoic philosophers. The wisdom contained in these quotes helps users stay grounded, reflect on perseverance, and build resilience in the face of adversity, acting as a philosophical anchor.

3. **Breath (ZenQuotes API)**
    - **Endpoint**: [https://zenquotes.io/api/random](https://zenquotes.io/api/random)
    - **Description**: This API endpoint is called to retrieve a single random motivational or calming quote. The content is perfectly suited to aid users in mindfulness and focused breathing exercises, providing a thoughtful point of focus to quiet the mind.

4. **Faith (Our Manna API)**
    - **Endpoint**: [https://beta.ourmanna.com/api/v1/get](https://beta.ourmanna.com/api/v1/get)
    - **Description**: This endpoint returns a random Bible verse or faith-based affirmation. Its purpose is to inspire hope, provide comfort, and strengthen the user's faith through curated scriptural wisdom.

5. **Kindness (Quotable API)**
    - **Endpoint**: [https://api.quotable.io/random?tags=inspirational|motivational|mindfulness|life](https://api.quotable.io/random?tags=inspirational|motivational|mindfulness|life)
    - **Description**: The Quotable API is queried with a specific set of tags including 'inspirational', 'motivational', 'mindfulness', and 'life'. This ensures the returned quote is relevant to themes of kindness, personal growth, and mindful living, offering a burst of inspiration.

6. **Reset (Scrimba API)**
    - **Endpoint**: [https://apis.scrimba.com/bored/api/activity?type=diy&type=relaxation](https://apis.scrimba.com/bored/api/activity?type=diy&type=relaxation)
    - **Description**: This endpoint suggests a unique random activity pulled from the Bored API. By specifying the `type` parameters as 'diy' and 'relaxation', it ensures the suggestions are tailored towards gentle, hands-on projects or calming exercises designed to help a user reset their mental state and engage in a distracting, productive task.
  
      
## Project Structure

The project's organization reflects its Clean Architecture, promoting clarity and modularity.

### Data Layer
- **RemoteDataSource.swift**: A central file responsible for executing all network requests using URLSession, handling errors, and parsing the returned JSON responses into Swift objects.
- **Responses Folder**: Contains individual, decodable Swift structs that model the JSON structure returned by each external API.
    - `AffirmResponse.swift`
    - `AnchorResponse.swift`
    - `BreathResponse.swift`
    - `FaithResponse.swift`
    - `KindnessResponse.swift`
    - `ResetResponse.swift`

### Domain Layer (The core business logic)
- **UseCase.swift**: A protocol that defines the essential structure and behavior for all use cases in the app, ensuring consistency.
- **Interactors**: Concrete implementations that contain the category-specific business logic. Each interactor calls the data source, processes the raw API response, and converts it into a simple domain model that the UI can understand.
    - `AffirmInteractor.swift`
    - `AnchorInteractor.swift`
    - `BreathInteractor.swift`
    - `FaithInteractor.swift`
    - `KindnessInteractor.swift`
    - `ResetInteractor.swift`

- **Domain Models**: Simple Swift structs that represent the pure data needed for presentation in the UI, independent of the network response structure.

### Presentation Layer (The UI built with SwiftUI)
- **Feature Screens**: Includes the main view that lists all categories, detailed views for each individual category, and a Terms and Conditions screen.
- **ViewModel**: For each screen, a ViewModel class exists that is responsible for preparing the domain data for display, triggering the use cases, and holding the state (e.g., loading, data, errors) using the ObservableObject protocol.
- **Reusable Views**: A collection of small, modular SwiftUI views that are used throughout the app to ensure a consistent look and feel.
    - `BackArrowButton.swift`: A custom back button.
    - `LoadingView.swift`: A spinner shown during data fetch.
    - `LogoHeaderView.swift`: The app's logo displayed at the top of screens.

### Resources
- **AppColors.swift**: A centralized file that defines color constants and custom color schemes used across the entire application for easy consistency and theming.
- **Assets**: This directory contains all image and graphical resources, including the application's main logo (`Logo.png`) and various background images used to enhance the visual appeal of different screens.

### Supporting Files
- **LaunchScreen.storyboard**: The configuration and design for the static screen that is displayed immediately upon launching the application before the main SwiftUI view loads.

## Development Challenges

1. **UI Design Pattern Selection**: The initial architectural planning phase involved a debate between using **VIPER**, which offers extreme modularity but with higher complexity, and **MVVM**. I ultimately decided that **MVVM**, especially when combined with SwiftUI and Combine, was the simpler, more native, and perfectly suitable pattern for this app's scale and objectives, providing a great balance of structure and development speed.
2. **Local vs Remote Data Strategy**: A key design decision was whether to store data locally or fetch it live. I chose to load all data directly from remote APIs for the initial version because each API returns a single, self-contained piece of content (a quote or activity), making the user experience inherently dynamic and eliminating the immediate need for a complex caching system.
3. **Security Implementation**: A significant technical hurdle was that several of the chosen public APIs did not support secure HTTPS connections, which is a modern security requirement. To address this without sacrificing security during development, I implemented a temporary workaround using SSL pinning for specific domains, ensuring data transmission remained protected.

## Future Improvements

- **Offline Caching**: Integrating a persistence layer, such as Core Data or a simple file-based cache, would dramatically improve the user experience by allowing access to previously fetched quotes and activities when the device has no internet connection.
- **Personalization Features**: Allowing users to favorite, bookmark, or save their most impactful quotes would create a more personalized and valuable tool, enabling users to build a library of go-to content for difficult moments.
- **Enhanced Security for Production**: The current SSL pinning implementation is a development-phase solution. For a production release, this would need to be refined and robustly managed, potentially involving a more sophisticated certificate management system or transitioning to APIs that fully support HTTPS.
