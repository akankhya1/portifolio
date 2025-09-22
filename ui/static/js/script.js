async function loadProjects() {
    try {
        let response = await fetch('/projects/'); // Ensure your endpoint matches Django URL
        if (!response.ok) throw new Error("Network response was not OK");

        let data = await response.json();
        let projectsList = document.getElementById('projects-list');
        projectsList.innerHTML = "";

        data.forEach(project => {
            const card = document.createElement('div');
            card.className = 'col-md-4';
            card.innerHTML = `
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">${project.title}</h5>
                        <p class="card-text">${project.description}</p>
                        <a href="${project.link}" target="_blank" class="btn btn-outline-primary">View Project</a>
                    </div>
                </div>
            `;
            projectsList.appendChild(card);
        });
    } catch (err) {
        console.error("Failed to load projects:", err);
    }
}

