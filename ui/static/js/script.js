// async function loadProjects() {
//     let response = await fetch('/api/projects/');
//     let data = await response.json();
//     let list = document.getElementById('projects');
//     list.innerHTML = "";
//     data.forEach(project => {
//         let li = document.createElement('li');
//         li.textContent = project.title + " - " + project.description;
//         list.appendChild(li);
//     });
// }



// function loadProjects() {
//     fetch('/projects/')
//         .then(response => response.json())
//         .then(data => {
//             const projectsList = document.getElementById('projects-list');
//             projectsList.innerHTML = '';
//             data.forEach(project => {
//                 const card = document.createElement('div');
//                 card.className = 'project-card';
//                 card.innerHTML = `
//                     <h3>${project.title}</h3>
//                     <p>${project.description}</p>
//                     <p><strong>Link:</strong> <a href="${project.link}" target="_blank">${project.link}</a></p>
//                 `;
//                 projectsList.appendChild(card);
//             });
//         })
//         .catch(err => console.error(err));
// }




async function loadProjects() {
    try {
        let response = await fetch('/projects/'); // make sure this URL is correct
        if (!response.ok) throw new Error("Network response was not OK");

        let data = await response.json();
        let list = document.getElementById('projects-list');
        list.innerHTML = "";

        data.forEach(project => {
            let card = document.createElement('div');
            card.className = 'project-card';
            card.innerHTML = `
                <h3>${project.title}</h3>
                <p>${project.description}</p>
                <p><strong>Link:</strong> <a href="${project.link}" target="_blank">${project.link}</a></p>
            `;
            list.appendChild(card);
        });
    } catch (err) {
        console.error("Failed to load projects:", err);
    }
}
