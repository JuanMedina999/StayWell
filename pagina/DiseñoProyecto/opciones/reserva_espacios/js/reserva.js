document.addEventListener('DOMContentLoaded', function() {
    const reservaForm = document.getElementById('reserva-form');
    const mensajeDiv = document.getElementById('mensaje');
    const reservas = document.querySelector('.reservas');
    const reservasLink = document.getElementById('reservas-link');
    const subMenu = document.getElementById('sub-menu');

    // Función para alternar la visibilidad del submenú
    reservasLink.addEventListener('click', () => {
        subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
    });

    const publicarBtn = document.getElementById('publicar-btn');
    const experienciaTextarea = document.getElementById('experiencia');
    const imagenInput = document.getElementById('imagen-experiencia');

    // Publicar la experiencia
    publicarBtn.addEventListener('click', () => {
        const experiencia = experienciaTextarea.value.trim();
        const imagen = imagenInput.files[0]; // Archivo de imagen seleccionado

        if (experiencia && imagen) {
            alert('Publicación realizada correctamente');
            experienciaTextarea.value = ''; // Resetea el campo de experiencia
            imagenInput.value = ''; // Resetea el campo de imagen
        } else if (experiencia) {
            alert('Tu experiencia ha sido publicada');
            experienciaTextarea.value = ''; // Resetea el campo de experiencia
        } else {
            alert('Por favor, escribe algo sobre tu experiencia antes de publicar.');
        }
    });

    // Manejador de envío del formulario de reserva
    reservaForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const nombre = document.getElementById('nombre').value.trim();
        const email = document.getElementById('email').value.trim();
        const telefono = document.getElementById('telefono').value.trim();
        const espacio = document.getElementById('espacio').value.trim();
        const fecha = document.getElementById('fecha').value.trim();
        const hora = document.getElementById('hora').value.trim();

        let errores = [];

        // Validaciones
        if (nombre === '') {
            errores.push('El nombre completo es obligatorio.');
        }
        if (email === '') {
            errores.push('El correo electrónico es obligatorio.');
        } else if (!validateEmail(email)) {
            errores.push('El correo electrónico no es válido.');
        }
        if (telefono === '') {
            errores.push('El teléfono es obligatorio.');
        }
        if (espacio === '') {
            errores.push('Debe seleccionar un espacio.');
        }
        if (fecha === '') {
            errores.push('La fecha de reserva es obligatoria.');
        }
        if (hora === '') {
            errores.push('La hora de reserva es obligatoria.');
        }

        // Mostrar errores si existen
        if (errores.length > 0) {
            mensajeDiv.innerHTML = errores.join('<br>');
            mensajeDiv.classList.remove('oculto', 'exito');
            mensajeDiv.classList.add('error');
        } else {
            // Si no hay errores, mostrar éxito
            mensajeDiv.innerHTML = '¡Reserva realizada correctamente!';
            mensajeDiv.classList.remove('oculto', 'error');
            mensajeDiv.classList.add('exito');
        }
    });

    // Función para validar el correo electrónico
    function validateEmail(email) {
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return re.test(String(email).toLowerCase());
    }
});
