## Test-Driven Development (TDD)

- Test-Driven Development - (TDD) is a software development methodology that focuses on creating automated tests before developing functional code. The TDD cycle is typically divided into three main stages: Red, Green, Refactor.

### TDD Cycle

1. **Red**: Write a failing test.

   - Create a test that describes a small part of the desired functionality.
   - Run the test and see it fail. This confirms the test is valid and the functionality is not yet implemented.

2. **Green**: Write the minimal code to pass the test.

   - Implement the necessary functionality to make the test pass.
   - Keep the code simple and to the point.

3. **Refactor**: Improve the code's structure and quality.
   - Refactor the code to make it cleaner, more efficient, and easier to maintain.
   - Ensure all tests still pass after refactoring.

### Benefits of TDD

- **Code Quality**: TDD encourages writing clean and well-structured code from the start.
- **Confidence in Changes**: With a comprehensive test suite, developers can confidently make changes, knowing that any issues will be quickly identified.
- **Living Documentation**: Tests serve as living documentation of the system's behavior, making the code easier to understand and maintain.
- **Software Design**: TDD promotes a more modular and well-defined software design, facilitating code reuse and maintenance.

---

## How to Write Good Tests

Tests should:

- Be reliable
- Be easy to write
- Be easy to understand today and in the future

- Better Specs
  https://www.betterspecs.org/

## Types of Tests

There are various types of tests that can be conducted to ensure the quality of an application. Here are some of the most common:

### Unit Tests

- **Purpose**: Test individual parts of the code, such as methods or functions, in isolation.
- **Advantages**: Quick to execute, easy to write and debug.
- **Tools**: [[RSpec]] for [[Ruby]] and [[Rails]].

### Integration Tests

- **Purpose**: Test the interaction between different parts of the system to ensure they work together correctly.
- **Advantages**: Identify integration issues not visible in unit tests.
- **Tools**: [[RSpec]] with support for fixtures and mocks.

### Functional Tests

- **Purpose**: Verify that the application works as expected from the user's perspective.
- **Advantages**: Ensure the application meets functional requirements.
- **Tools**: [[Capybara]] with [[RSpec]].

### Acceptance Tests

- **Purpose**: Validate that the system meets the acceptance criteria defined by the client.
- **Advantages**: Ensure the application meets client expectations.
- **Tools**: [[Cucumber]] with [[RSpec]].

### Regression Tests

- **Purpose**: Ensure that new changes do not introduce bugs in existing functionality.
- **Advantages**: Maintain system stability over time.
- **Tools**: Test automation with [[RSpec]].

## Test Pyramid

The test pyramid is a concept that illustrates the ideal quantity of each type of test in an application. It is divided into three main layers:

### Bottom Layer: Unit Tests

- **Proportion**: The majority of tests should be unit tests.
- **Reason**: They are quick and cheap to execute, providing fast feedback on code quality.

### Middle Layer: Integration Tests

- **Proportion**: Fewer than unit tests, but still substantial.
- **Reason**: Test the interaction between components and ensure they work together as expected.

### Top Layer: User Interface (UI) Tests

- **Proportion**: The fewest tests should be UI tests.
- **Reason**: They are slower and more expensive to execute, but are still important to ensure the application functions correctly from the user's perspective.

### Test Pyramid Visual

```plaintext
          /\
         /  \
        / UI \
       /------\
      /Integration\
     /------------\
    /   Unit Tests  \
   /----------------\
```

### Benefits of the Test Pyramid

- Maintaining a Good Balance: The pyramid helps maintain a healthy balance between different types of tests, ensuring adequate and efficient coverage.
- Cost Reduction: Unit and integration tests are cheaper and faster to execute than UI tests, leading to a more efficient development cycle.
- Confidence in Quality: Comprehensive test coverage gives developers confidence that the system works correctly at all levels.

Implementing the test pyramid in your testing strategy can help create a robust and efficient test suite, resulting in high-quality and maintainable software

---

## Rails Rspec

### RSpec in Rails with Shoulda Matchers

#### Test with Shoulda Matchers

see detailed [user_spec.rb](./rspec-tst-rails/hotwire-test-app-main/spec/models/user_spec.rb)

```ruby
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:user_courses) }
    it { should have_many(:courses).through(:user_courses) }
  end
end
```

### Explanation

The `Shoulda Matchers` simplify writing tests, allowing you to verify associations and validations concisely and legibly.

---

## Second Method

```ruby
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it 'has_many :user_courses' do
      expect(User.reflect_on_association(:user_courses)).to_not be_nil
    end

    it 'has_many :courses, through: :user_courses' do
      expect(User.reflect_on_association(:courses)).to_not be_nil
    end
  end
end
```

### Explanation

This method uses `reflect_on_association` to check for the presence of associations directly in the model's metadata.

---

## First Method

```ruby
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it 'has_many :user_courses' do
      user = User.create(email: 'test@test.com', name: 'Batman')
      course = Course.create(title: 'Batman Course', video_url: 'http://batman.com')
      user_course = UserCourse.create(user_id: user.id, course_id: course.id)

      expect(user.user_courses).to include(user_course)
    end

    it 'has_many :courses, through: :user_courses' do
      user = User.create(email: 'test@test.com', name: 'Batman')
      course = Course.create(title: 'Batman Course', video_url: 'http://batman.com')
      UserCourse.create(user_id: user.id, course_id: course.id)

      expect(user.courses).to include(course)
    end
  end
end
```

### Explanation

This method creates actual instances of the models to check the associations, ensuring the relationships work as expected.

---

### Conclusion

- **Shoulda Matchers**: Ideal for quick and readable tests of associations and validations.
- **Reflect_on_association**: Useful for checking the presence of associations in the metadata.
- **Creating Real Instances**: Ensures relationships work in practice, testing the full association logic.
