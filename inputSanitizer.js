// inputSanitizer.js

function setupInput(input) {
    if (typeof input === 'string') {
      input = input.trim();
      input = input.replace(/\\/g, '');
      input = input.replace(/'/g, ''); // To prevent SQL injection, you may consider escaping or using prepared statements instead
    }
    // Add additional validation or sanitization logic if required
    // For example, check for empty input and respond with an error:
    if (input.length === 0) {
      throw new Error("Input cannot be empty.");
    }
  
    return input;
  }
  
  module.exports = setupInput;
  