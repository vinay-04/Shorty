document.addEventListener("turbo:load", () => {
  const flashMessages = document.getElementById("flash-messages");
  if (flashMessages) {
    setTimeout(() => {
      flashMessages.style.display = "none";
    }, 5000); // Hide after 5 seconds
  }
});

// Handle Turbo cache
document.addEventListener("turbo:before-cache", () => {
  const flashMessages = document.getElementById("flash-messages");
  if (flashMessages) {
    flashMessages.innerHTML = "";
  }
});

// Handle Turbo render
document.addEventListener("turbo:render", () => {
  const flashMessages = document.getElementById("flash-messages");
  if (flashMessages) {
    flashMessages.style.display = "block";
  }
});
