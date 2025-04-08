document.addEventListener('DOMContentLoaded', function() {
    const reservaEventosForm = document.getElementById('reserva-eventos-form');
    const mensajeDiv = document.getElementById('mensaje');

    reservaEventosForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const nombreEvento = document.getElementById('nombreEvento').value.trim();
        const nombreOrganizador = document.getElementById('nombreOrganizador').value.trim();
        const emailOrganizador = document.getElementById('emailOrganizador').value.trim();
        const telefonoOrganizador = document.getElementById('telefonoOrganizador').value.trim();
        const fechaEvento = document.getElementById('fechaEvento').value.trim();
        const horaEvento = document.getElementById('horaEvento').value.trim();
        const numAsistentes = document.getElementById('numAsistentes').value.trim();
        const espacioEvento = document.getElementById('espacioEvento').value.trim();

        let errores = [];

        if (nombreEvento === '') {
            errores.push('El nombre del evento es obligatorio.');
        }
        if (nombreOrganizador === '') {
            errores.push('El nombre del organizador es obligatorio.');
        }
        if (emailOrganizador === '') {
            errores.push('El correo electrónico del organizador es obligatorio.');
        } else if (!validateEmail(emailOrganizador)) {
            errores.push('El correo electrónico no es válido.');
        }
        if (telefonoOrganizador === '') {
            errores.push('El teléfono del organizador es obligatorio.');
        }
        if (fechaEvento === '') {
            errores.push('La fecha del evento es obligatoria.');
        }
        if (horaEvento === '') {
            errores.push('La hora del evento es obligatoria.');
        }
        if (numAsistentes === '') {
            errores.push('El número de asistentes es obligatorio.');
        } else if (parseInt(numAsistentes) <= 0) {
            errores.push('El número de asistentes debe ser mayor a 0.');
        }
        if (espacioEvento === '') {
            errores.push('Debe seleccionar un espacio.');
        }

        if (errores.length > 0) {
            mensajeDiv.innerHTML = errores.join('<br>');
            mensajeDiv.classList.remove('oculto', 'exito');
            mensajeDiv.classList.add('error');
        } else {
            mensajeDiv.innerHTML = '¡Reserva de evento realizada correctamente!';
            mensajeDiv.classList.remove('oculto', 'error');
            mensajeDiv.classList.add('exito');
        }
    });

    function validateEmail(email) {
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return re.test(String(email).toLowerCase());
    }
});
