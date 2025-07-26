## Bloc Rules
### Naming Conventions
- Name events in the past tense, as they represent actions that have already occurred from the bloc's perspective.
- Use the format: BlocSubject + optional noun + verb (event). Example: LoginButtonPressed, UserProfileLoaded
- For initial load events, use: BlocSubjectStarted. Example: AuthenticationStarted
- The base event class should be named: BlocSubjectEvent.
- Name states as nouns, since a state is a snapshot at a particular point in time.
- When using subclasses for states, use the format: BlocSubject + Initial | Success | Failure | InProgress. Example: LoginInitial, LoginSuccess, LoginFailure, LoginInProgress
- For single-class states, use: BlocSubjectState with a BlocSubjectStatus enum (initial, success, failure, loading). Example: LoginState with LoginStatus.initial
- The base state class should always be named: BlocSubjectState.
### Modeling State
- Use a single concrete class with a status enum for simple, non-exclusive states or when many properties are shared.
- In the single-class approach, make properties nullable and handle them based on the current status.
- Extend Equatable for all state classes to enable value equality.
- Annotate state classes with @immutable to enforce immutability.
- Implement a copyWith method in state classes for easy state updates.
- Use const constructors for state classes when possible.
- Use a single concrete class with a status enum for simple, non-exclusive states or when many properties are shared.
- In the single-class approach, make properties nullable and handle them based on the current status.
- Use a sealed class with subclasses for well-defined, exclusive states.
- Store shared properties in the sealed base class; keep state-specific properties in subclasses.
- Use exhaustive switch statements to handle all possible state subclasses.
- Prefer the sealed class approach for type safety and exhaustiveness; prefer the single-class approach for conciseness and flexibility.
- Always pass all relevant properties to the props getter when using Equatable in state classes.
- When using Equatable, copy List or Map properties with List.of or Map.of tPo ensure value equality.
- To retain previous data after an error, use a single state class with nullable data and error fields.
- Emit a new instance of the state each time you want the UI to update; do not reuse the same instance.
### Bloc Concepts

- Use Cubit for simple state management without events; use Bloc for more complex, event-driven state management.
- Define the initial state by passing it to the superclass in both Cubit and Bloc.
- Only use the emit method inside a Cubit or Bloc; do not call it externally.
- UI components should listen to state changes and update only in response to new states.
- Duplicate states (state == nextState) are ignored; no state change will occur.
- Override onChange in Cubit or Bloc to observe all state changes.
- Use a custom BlocObserver to observe all state changes and errors globally.
- Override onError in both Cubit/Bloc and BlocObserver for error handling.
- Add events to a Bloc in response to user actions or lifecycle events.
- Use onTransition in Bloc to observe the full transition (event, current state, next state).
- Use event transformers (e.g., debounce, throttle) in Bloc for advanced event processing.
- Prefer Cubit for simplicity and less boilerplate; prefer Bloc for traceability and advanced event handling.
- If unsure, start with Cubit and refactor to Bloc if needed as requirements grow.
- Initialize BlocObserver in main.dart for debugging and logging.
- Always keep business logic out of UI widgets; only interact with cubits/blocs via events or public methods.
- Internal events in a bloc should be private and only used for real-time updates from repositories.
- Use custom event transformers for internal events if needed.
- When exposing public methods on a cubit, only use them to trigger state changes and return void or Future<void>.
- For blocs, avoid exposing custom public methods; trigger state changes by adding events.
- When using BlocProvider.of(context), call it within a child BuildContext, not the same context where the bloc was provided.
### Architecture
- Separate your features into three layers: Presentation, Business Logic, and Data.
- The Data Layer is responsible for retrieving and manipulating data from sources such as databases or network requests.
- Structure the Data Layer into repositories (wrappers around data providers) and data providers (perform CRUD operations).
- The Business Logic Layer responds to input from the presentation layer and communicates with repositories to build new states.
- The Presentation Layer renders UI based on bloc states and handles user input and lifecycle events.
- Inject repositories into blocs via constructors; blocs should not directly access data providers.
- Avoid direct bloc-to-bloc communication to prevent tight coupling.
- To coordinate between blocs, use BlocListener in the presentation layer to listen to one bloc and add events to another.
- For shared data, inject the same repository into multiple blocs; let each bloc listen to repository streams independently.
- Always strive for loose coupling between architectural layers and components.
- Structure your project consistently and intentionally; there is no single right way.
### Flutter Bloc Concepts
- Use BlocBuilder to rebuild widgets in response to bloc or cubit state changes; the builder function must be pure.
- Use BlocListener to perform side effects (e.g., navigation, dialogs) in response to state changes.
- Use BlocConsumer when you need both BlocBuilder and BlocListener functionality in a single widget.
- Use BlocProvider to provide blocs to widget subtrees via dependency injection.
- Use MultiBlocProvider to provide multiple blocs and avoid deeply nested providers.
- Use BlocSelector to rebuild widgets only when a selected part of the state changes.
- Use MultiBlocListener to listen for state changes and trigger side effects; avoid nesting listeners by using MultiBlocListener.
- Use RepositoryProvider to provide repositories or services to the widget tree.
- Use MultiRepositoryProvider to provide multiple repositories and avoid nesting.
- Use context.read<T>() to access a bloc or repository without listening for changes (e.g., in callbacks).
- Use context.watch<T>() inside the build method to listen for changes and trigger rebuilds.
- Use context.select<T, R>() to listen for changes in a specific part of a bloc’s state.
- Avoid using context.watch or context.select at the root of the build method to prevent unnecessary rebuilds.
- Prefer BlocBuilder and BlocSelector over context.watch and context.select for explicit rebuild scoping.
- Scope rebuilds using Builder when using context.watch or context.select for multiple blocs.
- Handle all possible cubit/bloc states explicitly in the UI (e.g., empty, loading, error, populated).
### Testing
- Add the test and bloc_test packages to your dev dependencies for bloc testing.
- Organize tests into groups to share setup and teardown logic.
- Create a dedicated test file (e.g., counter_bloc_test.dart) for each bloc.
- Import the test and bloc_test packages in your test files.
- Use setUp to initialize bloc instances before each test and tearDown to clean up after tests.
- Test the bloc’s initial state before testing transitions.
- Use the blocTest function to test bloc state transitions in response to events.
- Assert the expected sequence of emitted states for each bloc event.
- Keep tests concise, focused, and easy to maintain to ensure confidence in refactoring.
- Mock cubits/blocs in widget tests to verify UI behavior for all possible states.

## Flutter App Architecture
### Architecture
- Use the Clean Architecture approach to structure your Flutter app.
- Separate your features into a UI Layer (presentation), a Data Layer (business data and logic), and, for complex apps, consider adding a Domain (Logic) Layer between UI and Data layers to encapsulate business logic and use-cases.
- You can organize code by feature: The classes needed for each feature are grouped together. For example, you might have an auth directory, which would contain files like auth_viewmodel.dart (or, depending on your state management approach: auth_controller.dart, auth_provider.dart, auth_bloc.dart), login_usecase.dart, logout_usecase.dart, login_screen.dart, logout_button.dart, etc. Alternatively, you can organize by type or use a hybrid approach.
- Only allow communication between adjacent layers; the UI layer should not access the data layer directly, and vice versa.
- Introduce a Logic (Domain) Layer only for complex business logic that does not fit cleanly in the UI or Data layers.
- Clearly define the responsibilities, boundaries, and interfaces of each layer and component (Views, View Models, Repositories, Services).
- Further divide each layer into components with specific responsibilities and well-defined interfaces.
- In the UI Layer, use Views to describe how to present data to the user; keep logic minimal and only UI-related.
- Pass events from Views to View Models in response to user interactions.
- In View Models, contain logic to convert app data into UI state and maintain the current state needed by the view.
- Expose callbacks (commands) from View Models to Views and retrieve/transform data from repositories.
- In the Data Layer, use Repositories as the single source of truth (SSOT) for model data and to handle business logic such as caching, error handling, and refreshing data.
- Only the SSOT class (usually the repository) should be able to mutate its data; all other classes should read from it.
- Repositories should transform raw data from services into domain models and output data consumed by View Models.
- Use Services to wrap API endpoints and expose asynchronous response objects; services should isolate data-loading and hold no state.
- Use dependency injection to provide components with their dependencies, enabling testability and flexibility.
### Data Flow and State
- Follow unidirectional data flow: state flows from the data layer through the logic layer to the UI layer, and events from user interaction flow in the opposite direction.
- Data changes should always happen in the SSOT (data layer), not in the UI or logic layers.
- The UI should always reflect the current (immutable) state; trigger UI rebuilds only in response to state changes.
- Views should contain as little logic as possible and be driven by state from View Models.
### Use Cases / Interactors
- Introduce use cases/interactors in the domain layer only when logic is complex, reused, or merges data from multiple repositories.
- Use cases depend on repositories and may be used by multiple view models.
- Add use cases only when needed; refactor to use use-cases exclusively if logic is repeatedly shared across view models.
### Extensibility and Testability
- All architectural components should have well-defined inputs and outputs (interfaces).
- Favor dependency injection to allow swapping implementations without changing consumers.
- Test view models by mocking repositories; test UI logic independently of widgets.
- Design components to be easily replaceable and independently testable.
### Best Practices
- Strongly recommend following separation of concerns and layered architecture.
- Strongly recommend using dependency injection for testability and flexibility.
- Recommend using MVVM as the default pattern, but adapt as needed for your app's complexity.
- Use key-value storage for simple data (e.g., configuration, preferences) and SQL storage for complex relationships.
- Use optimistic updates to improve perceived responsiveness by updating the UI before operations complete.
- Support offline-first strategies by combining local and remote data sources in repositories and enabling synchronization as appropriate.
- Keep views focused on presentation and extract reusable widgets into separate components.
- Use StatelessWidget when possible and avoid unnecessary StatefulWidgets.
- Keep build methods simple and focused on rendering.
### State Management
- Choose state management approaches appropriate to the complexity of your app.
- Keep state as local as possible to minimize rebuilds and complexity.
- Use const constructors when possible to improve performance.
- Avoid expensive operations in build methods and implement pagination for large lists.
- Keep files focused on a single responsibility and limit file length for readability.
- Group related functionality together and use final for fields and top-level variables when possible.
- Prefer making declarations private and consider making constructors const if the class supports it.
- Follow Dart naming conventions and format code using dart format.
- Use curly braces for all flow control statements to ensure clarity and prevent bugs.
