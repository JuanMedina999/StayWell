document.addEventListener('DOMContentLoaded', function () {
    const continuarBtn = document.getElementById('continuar-btn');
    const volverBtn = document.getElementById('volver-btn');
    const submitBtn = document.getElementById('submit-btn');
    const tipoReservaSelect = document.getElementById('tipoReserva');

    const secciones = {
        habitacion: document.getElementById('reserva-habitacion'),
        espacio: document.getElementById('reserva-espacio'),
        evento: document.getElementById('reserva-evento'),
    };

    continuarBtn.addEventListener('click', function () {
        const tipoReserva = tipoReservaSelect.value;

        if (!tipoReserva) {
            alert('Por favor, selecciona un tipo de reserva.');
            return;
        }

        Object.values(secciones).forEach(div => div.classList.add('oculto'));
        secciones[tipoReserva]?.classList.remove('oculto');

        continuarBtn.classList.add('oculto');
        volverBtn.classList.remove('oculto');
        submitBtn.classList.remove('oculto');
    });

    volverBtn.addEventListener('click', function () {
        // Ocultar todas las secciones y regresar al formulario inicial
        Object.values(secciones).forEach(div => div.classList.add('oculto'));

        // Mostrar únicamente el selector inicial
        tipoReservaSelect.value = '';
        continuarBtn.classList.remove('oculto');
        volverBtn.classList.add('oculto');
        submitBtn.classList.add('oculto');
    });
});
