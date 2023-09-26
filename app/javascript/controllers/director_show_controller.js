import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  connect(){
    const deleteButtons = document.querySelectorAll(".delete-group")
    const deletePopup = document.getElementById("delete-group-popup")

    deleteButtons.forEach(button => {
      button.addEventListener('click', () => {
        deletePopup.classList.add('popup')
        const confirmDelete = document.getElementById("confirm-delete")
        const cancelDelete = document.getElementById("cancel-delete")

        cancelDelete.addEventListener('click', () => {
          deletePopup.classList.remove('popup')
        })

        confirmDelete.addEventListener('click', async() => {
          const response = await fetch(`/groups/${button.id}`, {
            method: 'DELETE',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'), // Include CSRF token
            }
          })

          console.log(response)

          if (response.ok) {
            // Handle success (e.g., close the popup, refresh the page, or provide feedback to the user)
            deletePopup.classList.remove('popup');
            window.location.reload(); // For example, refresh the page after successful deletion
          } else {
            // Handle error (e.g., display an error message to the user)
            console.error('Failed to delete group');
          }
        }) 
      })
    })
  }
}