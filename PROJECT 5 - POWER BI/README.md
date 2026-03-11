# 📊 KPIS_INDITEX_ONETEAM – Power BI Data Analytics Project

## 📌 Descripción del proyecto

Este proyecto consiste en el desarrollo de un **dashboard integral en Power BI** para consolidar y visualizar los **KPIs operativos y de negocio relacionados con el cliente INDITEX**, integrando información procedente de distintos subequipos de trabajo.

Dentro de un mismo equipo existían **varios subequipos trabajando con el mismo cliente**, cada uno gestionando sus propios **Excel de seguimiento y KPIs**. Esto generaba varios problemas:

- ❌ Falta de visibilidad global del negocio con el cliente  
- ❌ Información fragmentada entre subequipos  
- ❌ Dificultad para analizar tendencias y volúmenes globales  
- ❌ Falta de una narrativa común de datos para reuniones con stakeholders  

Para solucionar este problema se desarrolló un **modelo analítico en Power BI** que permite:

- Integrar datos de múltiples fuentes y subequipos  
- Automatizar la carga de datos desde archivos Excel  
- Construir una **base de datos viva**, que crecerá cada año  
- Crear dashboards interactivos para análisis y reporting  

El archivo principal del proyecto es:

```
KPIS_INDITEX_ONETEAM.pbix
```

Este archivo se conecta a varias carpetas y archivos Excel que contienen los datos operativos de cada subequipo.
No obstante, el archivo informe_INDITEXPBI.pdf es el que explica, de forma resumida, todo el trabajo (procesos y transformaciones) llevado a cabo.
 
---

# 📂 Archivos incluidos

El proyecto se basa en una **estructura de carpetas organizada por equipos y funciones**.

```
Project Folder
│
├── KPIS_INDITEX_ONETEAM.pbix
├── informe_INDITEXPBI.pdf
│
├── Control Tower - NETHERLANDS (CT NL)
│   ├── KPIs_2025_CTNL_OCEAN.xlsx
│   └── KPIs_2026_CTNL_OCEAN.xlsx
│
├── Control Tower - SPAIN (CT ES)
│   ├── KPIs_2025_ES.xlsx
│   └── KPIs_2026_ES.xlsx
│
├── Forwarding - SPAIN (FW ES)
│   │
│   ├── CESIONES
│   │   ├── KPIs CESIONES 2025.xlsx
│   │   └── KPIs CESIONES 2026.xlsx
│   │
│   ├── FACTURACION
│   │   ├── KPIs FACTURACIÓN 2025.xlsx
│   │   └── KPIs FACTURACIÓN 2026.xlsx
│   │
│   └── PREALERTAS
│       ├── KPIs Prealertas 2025.xlsx
│       └── KPIs Prealertas 2026.xlsx
│
└── OCEAN
    │
    ├── ECO
    │   └── ECO_Delivery_Master_Report_2025.xlsx
    │
    └── KPIS - ocean volumes
        └── ITX - MAERSK OCEAN DASHBOARD.xlsx
```

💡 Cada año se añadirá un **nuevo archivo con el mismo nombre pero actualizado con el nuevo año**, permitiendo mantener el modelo actualizado sin modificar la estructura.

---

# 🧠 Estructura del análisis

El proyecto se construyó siguiendo un **modelo de datos tipo estrella (Star Schema)** con un **timeline central** que permite analizar la evolución temporal de los KPIs.

## Proceso analítico

### 1️⃣ Selección de fuentes de datos

Se identificaron fuentes:

- Internas del equipo  
- Reports del cliente  
- Reportes operativos de sistemas logísticos  

Estas fuentes alimentan los **Excel de KPIs** que posteriormente se conectan a Power BI.

---

### 2️⃣ Construcción de la base de datos

Los archivos Excel se alimentan mediante:

- Actualizaciones semanales  
- Macros automatizadas  
- Exportaciones de reportes operativos  

Posteriormente se añadieron **columnas adicionales** para adaptar los datos a los requisitos del cliente.

---

### 3️⃣ Transformación y modelado en Power BI

En Power BI se realizaron varias tareas:

- Conexión a múltiples archivos y carpetas  
- Transformación de datos (**Power Query**)  
- Creación de columnas calculadas con **DAX**  
- Creación de **medidas analíticas**  
- Ajuste de **parámetros y relaciones**  
- Integración de **múltiples tablas**

Esto permitió consolidar todos los datos en **un único modelo analítico**.

---

# 📊 Dashboards creados

El informe se divide en **distintas páginas**, cada una enfocada en un área operativa o parte del negocio.

## Páginas del dashboard

- 🇳🇱 **NETHERLANDS**
- 👕 **LEFTIES**
- 🏠 **ZARA HOME**
- 👞 **TEMPE**
- 🇲🇦 **MARRUECOS**
- 🌱 **ECO**
- 🌊 **OCEAN**
- 🚚 **FW (Forwarding)**

Cada página muestra:

- KPIs clave  
- Evolución temporal  
- Volúmenes operativos  
- Métricas específicas de cada subequipo  

---

# ⚙️ Requisitos

Para ejecutar el proyecto es necesario:

- 💻 Microsoft Power BI Desktop  
- Acceso a las carpetas con los archivos Excel  
- Mantener la misma estructura de carpetas  

Opcional:

- Conexión a los sistemas que generan los reports originales.

---

# ▶️ Cómo ejecutar el proyecto

1. Descargar o clonar el repositorio.  
2. Mantener la estructura de carpetas del proyecto.  
3. Abrir el archivo:

```
KPIS_INDITEX_ONETEAM.pbix
```

en **Microsoft Power BI Desktop**.

4. Si es necesario, actualizar las rutas de los archivos Excel.  
5. Hacer clic en **Refresh Data**.  
6. Navegar entre los dashboards y aplicar filtros de fecha o área.

---

# 📈 Resultados clave

Gracias a este proyecto se consiguió:

- ✅ Unificar la información de todos los subequipos  
- ✅ Tener una **visión global del negocio con INDITEX**  
- ✅ Facilitar el **seguimiento mensual con stakeholders**  
- ✅ Permitir **análisis histórico desde 2025 en adelante**  
- ✅ Automatizar la actualización de datos  

El dashboard permite:

- Filtrar por **mes, área o tipo de operación**  
- Analizar **tendencias de volumen**  
- Detectar **cuellos de botella operativos**  
- Presentar resultados en **reuniones mensuales de negocio**

---

# 👤 Autor

**Proyecto realizado por**

Autor: **Joan Martínez Codina**  
Máster: **ThePower Business School – Data Analytics**  
Proyecto práctico: **Power BI – Data Analysis & Visualization**
