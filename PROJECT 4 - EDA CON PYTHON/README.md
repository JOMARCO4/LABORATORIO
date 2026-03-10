# Análisis Exploratorio de Datos (EDA) - Campañas de Marketing Bancario

## Descripción del Proyecto

Este proyecto realiza un análisis exploratorio de datos (EDA) sobre campañas de marketing telefónico llevadas a cabo por una entidad bancaria portuguesa. Los datos incluyen información sobre clientes, resultados de campañas, y variables económicas y demográficas.

El objetivo es entender qué factores influyen en la decisión del cliente de suscribir un depósito a plazo, mediante la exploración, limpieza, imputación y análisis estadístico de los datos.

## Archivos Incluidos

- `entrega.ipynb`: Notebook principal donde se realiza todo el análisis.
- `bank-additional.csv`: Datos de campañas de marketing.
- `customer-details.xlsx`: Información adicional sobre clientes, repartida en hojas por año.
- `informe_final.pdf`: Informe profesional listo para entrega o presentación.

## Estructura del Análisis

1. **Carga de Datos**: Lectura de múltiples fuentes y unión mediante identificadores.
2. **Limpieza e Imputación**:
   - Imputación por media, moda y codificación de valores desconocidos.
   - Conversión de tipos y fechas.
3. **Análisis Descriptivo**:
   - Estadísticas como media, mediana, desviación estándar.
   - Visualización de la distribución de variables.
4. **Análisis Bivariado**:
   - Comparación de variables respecto a la conversión (`y`).
   - Gráficos de caja, histogramas y proporciones por categoría.
5. **Correlación**:
   - Matriz de correlación para variables numéricas.
6. **Conclusiones y Recomendaciones**:
   - Identificación de variables clave.
   - Sugerencias para segmentación y modelado predictivo.

## Requisitos

Este proyecto utiliza las siguientes librerías de Python:

- `pandas`
- `numpy`
- `matplotlib`
- `seaborn`
- `openpyxl`
- `markdown2`
- `weasyprint`

Instalación recomendada:

```bash
pip install -r requirements.txt
```

## Cómo Ejecutar

1. Asegúrate de tener los archivos de datos en la misma carpeta que el notebook.
2. Abre y ejecuta `entrega.ipynb` en Jupyter Notebook o VS Code.
3. Sigue las celdas para ver el análisis paso a paso.

## Resultados Clave

- La duración de la llamada (`duration`) es el principal indicador de conversión.
- Ciertos perfiles como `retired`, `students` y personas con `university.degree` presentan mejores tasas de conversión.
- Los clientes sin préstamos (`loan`, `housing`) tienen mayor probabilidad de conversión.

## Autor

Joan Martínez Codina

