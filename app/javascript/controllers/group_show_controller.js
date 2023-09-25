import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    const selectProfession = document.querySelector(".select-profession");
    const selectJobplace = document.querySelector(".select-jobplace")
    const selectJob = document.querySelector(".select-job")
    const searchBtn = document.querySelector(".search-btn")
    const cleanBtn = document.querySelector(".clean-btn")
    const professions = document.querySelectorAll(".profession")
    const searchResults = document.querySelector(".search-results")
    let profession, jobplace, job ;
    let counter = 0;

    function searchProfession(param){
      if(param == undefined) {
        return;
      }
      professions.forEach(prof => {
        let filterChild = []
        prof.childNodes.forEach(child => {
          if(child.localName == 'li'){
            filterChild.push(child.innerText)
          }})
          for(let i = 0; i < filterChild.length ; i++){
          if(filterChild[i].toLowerCase() == param.toLowerCase()){
            counter += 1;
            prof.parentElement.parentElement.parentElement.style.display = "flex"
            break;
          }else {
            prof.parentElement.parentElement.parentElement.style.display = "none"
          }
        }
      });
    }

    function clean(){
      professions.forEach( prof => {
        prof.parentElement.parentElement.parentElement.style.display = "flex"
      } )
      counter = 0;
      searchResults.style.display = "none";
    }

    selectProfession.addEventListener('change', () => {
      profession = selectProfession.value
      clean();
    })
    
    selectJobplace.addEventListener('change', () => {
      jobplace = selectJobplace.value
      profession = selectProfession.value
    })
    
    selectJob.addEventListener('change', () => {
      job = selectJob.value
    })
    
    searchBtn.addEventListener('click', () => {
      console.log(profession, jobplace, job);
      if(profession != undefined){
        searchProfession(profession);
      }
      if (profession == undefined && jobplace == undefined && job == undefined) {
        searchResults.style.display = "block";
        searchResults.innerText = `Seleccione un parametro de búsqueda`
        setTimeout(() => {
          searchResults.style.display = "none";
        }, 2000)
      } else {
        searchResults.style.display = "block";
        searchResults.innerText = `Se han encontrado: ${counter} resultados`
      }
    })
    
    cleanBtn.addEventListener('click', () => {
      selectProfession.value = 'undefined'
      selectJobplace.value = 'undefined' 
      selectJob.value = 'undefined' 
      job = 'undefined' 
      jobplace = 'undefined' 
      profession = 'undefined' 
      clean();
    })
  }
}
