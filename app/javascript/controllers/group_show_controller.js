import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    const selectProfession = document.querySelector(".select-profession");
    const selectJobplace = document.querySelector(".select-jobplace")
    const selectJob = document.querySelector(".select-job")
    const searchBtn = document.querySelector(".search-btn")
    const cleanBtn = document.querySelector(".clean-btn")
    const professions = document.querySelectorAll(".profession")
    const jobplaces = document.querySelectorAll(".jobplace")
    const jobs = document.querySelectorAll(".job")
    const searchResults = document.querySelector(".search-results")
    let profession, jobplace, job ;

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
            prof.parentElement.parentElement.parentElement.style.display = "flex"
            break;
          }else {
            prof.parentElement.parentElement.parentElement.style.display = "none"
          }
        }
      });
    }

    function searchJobplaces(param){
      if(param == undefined) {
        return;
      }
      jobplaces.forEach(jobplace => {
        let filterChild = []
        jobplace.childNodes.forEach(child => {
          if(child.localName == 'li'){
            filterChild.push(child.innerText)
          }})
          for(let i = 0; i < filterChild.length ; i++){
            if(filterChild[i].toLowerCase() == param.toLowerCase()){
              jobplace.parentElement.parentElement.parentElement.style.display = "flex"
              break;
            }else {
              jobplace.parentElement.parentElement.parentElement.style.display = "none"
            }
        }
      });
    }
    
    function searchJobs(param){
      if(param == undefined) {
        return;
      }
      jobs.forEach(job => {
        let filterChild = []
        job.childNodes.forEach(child => {
          if(child.localName == 'li'){
            filterChild.push(child.innerText)
          }})
          for(let i = 0; i < filterChild.length ; i++){
            if(filterChild[i].toLowerCase() == param.toLowerCase()){
              job.parentElement.parentElement.parentElement.style.display = "flex"
              break;
            }else {
              job.parentElement.parentElement.parentElement.style.display = "none"
            }
        }
      });
    }

    function clean(){
      professions.forEach( prof => {
        prof.parentElement.parentElement.parentElement.style.display = "flex"
      } )
      jobplaces.forEach( jobplace => {
        jobplace.parentElement.parentElement.parentElement.style.display = "flex"
      } )
      jobs.forEach( jobplace => {
        jobplace.parentElement.parentElement.parentElement.style.display = "flex"
      } )
      searchResults.style.display = "none";
    }

    selectProfession.addEventListener('change', () => {
      profession = selectProfession.value
      clean();
    })
    
    selectJobplace.addEventListener('change', () => {
      jobplace = selectJobplace.value
      clean();
    })
    
    selectJob.addEventListener('change', () => {
      job = selectJob.value
      clean();
    })
    
    searchBtn.addEventListener('click', () => {
      if(profession != undefined){
        searchProfession(profession);
      }

      if(jobplace != undefined){
        searchJobplaces(jobplace);
      }
      
      if(job != undefined){
        searchJobs(job);
      }

      const profiles = document.querySelectorAll('.group-profile');
      const filteredProfiles = [];
      profiles.forEach(profile => {
        if(profile.style.display == 'flex'){
          filteredProfiles.push(profile)
        }
      })

      if (profession == undefined && jobplace == undefined && job == undefined) {
        searchResults.style.display = "block";
        searchResults.innerText = `Seleccione un parametro de búsqueda.`
        setTimeout(() => {
          searchResults.style.display = "none";
        }, 2000)
      } else {
        searchResults.style.display = "block";
        searchResults.innerText = `Se han encontrado: ${filteredProfiles.length} resultado/s.`
      }

      selectProfession.value = undefined
      selectJobplace.value = undefined 
      selectJob.value = undefined 
    })
    
    cleanBtn.addEventListener('click', () => {
      selectProfession.value = undefined
      selectJobplace.value = undefined 
      selectJob.value = undefined 
      job = undefined 
      jobplace = undefined 
      profession = undefined 
      clean();
    })
  }
}
