function loadContent(page) {
    const mainContent = document.getElementById('main-content');
    let content = '';

    switch (page) {
        case 'perfil':
            content = `...`;  // Aquí insertas el contenido HTML para el perfil
            break;

        case 'habitaciones':
            fetch('pagina/DiseñoProyecto/opciones/reserva_habitaciones/reservas_habitaciones.html')
                .then(response => response.text())
                .then(html => {
                    mainContent.innerHTML = html;
                })
                .catch(error => {
                    mainContent.innerHTML = "<p>Hubo un error al cargar las reservas de habitaciones.</p>";
                    console.error("Error al cargar el contenido de habitaciones:", error);
                });
            return;

        case 'espacios':
            fetch('DiseñoProyecto/opciones/reserva_espacios/reservas_espacios.html')
                .then(response => response.text())
                .then(html => {
                    mainContent.innerHTML = html;
                })
                .catch(error => {
                    mainContent.innerHTML = "<p>Hubo un error al cargar las reservas de espacios.</p>";
                    console.error("Error al cargar el contenido de espacios:", error);
                });
            return;

        case 'eventos':
            fetch('DiseñoProyecto/opciones/reserva_eventos/reservas_eventos.html')
                .then(response => response.text())
                .then(html => {
                    mainContent.innerHTML = html;
                })
                .catch(error => {
                    mainContent.innerHTML = "<p>Hubo un error al cargar las reservas de eventos.</p>";
                    console.error("Error al cargar el contenido de eventos:", error);
                });
            return;

        case 'realizarReserva':
            fetch('pagina/DiseñoProyecto/realizar_reserva/realizarReserva.html')
                .then(response => response.text())
                .then(html => {
                    mainContent.innerHTML = html;
                })
                .catch(error => {
                    mainContent.innerHTML = "<p>Hubo un error al cargar la página de realizar reserva.</p>";
                    console.error("Error al cargar el contenido de realizar reserva:", error);
                });
            return;

        case 'calendario':
            fetch('D:/proyecto/Diseño Proyecto/pagina/pagina/calendario/calendarioHotel.html')
                .then(response => response.text())
                .then(html => {
                    mainContent.innerHTML = html;
                })
                .catch(error => {
                    mainContent.innerHTML = "<p>Hubo un error al cargar el calendario de eventos.</p>";
                    console.error("Error al cargar el contenido del calendario:", error);
                });
            return;

        default:
            content = `
                <h1>Bienvenido al Panel de Usuario</h1>
                <p>Selecciona una opción en el menú para comenzar.</p>
            `;
    }

    mainContent.innerHTML = content;
}

function toggleSubMenu() {
    const subMenu = document.querySelector('.sub-menu');
    subMenu.classList.toggle('visible');
}