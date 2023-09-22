import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    console.log('hello, group')
    const selectProfession = document.querySelector(".select-profession");
    const selectJobplace = document.querySelector(".select-jobplace")
    const selectJob = document.querySelector(".select-job")
    const searchBtn = document.querySelector(".search-btn")
    const cleanBtn = document.querySelector(".clean-btn")
    let profession, jobplace, job ;

    selectProfession.addEventListener('change', () => {
      profession = selectProfession.value
    })
    
    selectJobplace.addEventListener('change', () => {
      jobplace = selectJobplace.value
      profession = selectProfession.value
    })
    
    selectJob.addEventListener('change', () => {
      job = selectJob.value
      jobplace = selectJobplace.value
      profession = selectProfession.value
    })
    
    searchBtn.addEventListener('click', () => {
      console.log(profession, jobplace, job)
    })
    
    cleanBtn.addEventListener('click', () => {
      selectProfession.value = 'undefined'
      selectJobplace.value = 'undefined' 
      selectJob.value = 'undefined' 
    })
  }
}
