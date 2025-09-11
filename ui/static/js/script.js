async function loadProjects() {
    let response = await fetch('/api/projects/');
    let data = await response.json();
    let list = document.getElementById('projects');
    list.innerHTML = "";
    data.forEach(project => {
        let li = document.createElement('li');
        li.textContent = project.title + " - " + project.description;
        list.appendChild(li);
    });
}