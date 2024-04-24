# Tableau

## https://public.tableau.com/app/learn/how-to-videos

### Ctrl-z capabilities are included! (also 'undo' button in the top left)

### Connecting to Data
* The left column shows various ways that you can "connect" to data.
* File types: 
    * Excel sheet
    * Text file
    * JSON file
    * Microsoft Access
    * PDF file
    * Spatial file
    * Statistical file

* Servers:
    * OData
    * Google Drive
    * Perhaps more that must be installed to use?

* Tableau will automatically identify the data types of each column. This is shown in the bottom half, left side; shown as ``Table details`` when collapsed.
* Data symbols:
    * \# = Number (whole or decimal)
    * Abc = String
    * Calendar = Date
    * Globe = String with a Geographic Role

* Data types:
    * Number (whole or decimal)
    * Strings (can have a geographic role set)
    * Date
    * Date & Time
    * Boolean
    * Spatial (geometric or geographic data)

### Dataset Relationships

* Dragging a second sheet to the right will change to a view of the relationship between your active sheets. This is the ``Edit Relationship`` view.

* Tables are related based on common fields.

* The ``Noodle`` at the top between the two table names shows a summary of the relationship if you hover over it. Click on the noodle to display the ``Edit Relationship`` view again if necessary.

* With a relationship arranged, one can then use the joined tables as a ``Data Source`` by going down to the bottom left and clicking ``Sheet #``.

* (Tableau Public browser version) Save your data source into a Workbook with the ``Publish`` button at the top-right of the Sheet # page.

### Sheets

* You can create one visualization per sheet. Sheets are combined to create dashboards and stories.

* Left panel shows the data source and fields separated into two categories by a horizontal line. 
    * Those above the line are ``Dimensions``, which are qualitative and descriptive values such as names, dates, locations and IDs. These control the level of aggregation; like the categories used for the ``GROUP BY`` keyword in SQL.
    * Those below the line are ``Measures``; quanitative values which can be aggregated with functions such as sum() and average().
    * ``Dimensions`` can be placed into ``Hierarchies`` which contain similar dimensions associated with different levels, such as a Location hierarchy which contains the dimensions Country, Region, State, City, etc.
    * Fields can be hidden to clean up the workspace of fields you don't plan to use.
    * At the top of this panel, there is a drop-down menu which you can use to create a new ``Calculated Field``. Calculated fields show up in this left panel with an ``=`` next to their icon.

* The ``Show Me`` button in the top right of the Worksheet will show suggested visualizations based on the fields you have currently selected.
    * Select multiple fields by holding ``ctlr`` and clicking on them. Then use the ``Show Me`` button to automatically build an appropriate visualization if possible.

* The next panel to the right of the datasource panel shows ``Cards`` such as ``Pages``, ``Filters``, and ``Marks``. 

* The ``Marks`` card controls various details about the representation of the data, including colors, shapes, and format of numbers.

* The ``Filters`` card gives control on how to select subsets of data by filtering. Fields can be dragged into the ``Filters`` card to create a filter based on that field.
    * A filter can be shown and used interactively on the right side of the screen by going to the dropdown menu of the ``Filters`` card and selecting ``Show Filter``.
    * The appearance and functionality of that filter on the right can be changed using its drop-down menu.
    * You can also make filters from fields not placed within the ``Filters`` card by selecting the drop-down menu of that field and selecting ``Show Filter``.

* ``Area Charts`` are line charts with a shaded area below them. Useful for accumulated values over time and stacked lines that would be difficult to see without the shading.

* The ``Shelves`` above the main ``View`` area show the rows and columns of the current visualization.
    * Discrete fields are colored blue and continuous fields are green.
    * Drag and drop fields into the rows or columns to add to the current visualization, or drop on top of a field already present to replace it.
    * Use the drop-down menus in the names of the currently selected fields here to format them within the visualization.

* The ``View`` is the largest area which shows the current visualization.
    * Edit the axes of a visualization by selecting the drop-down menu at the end of that axis.
    * Remove an axis by using the drop-down menu of the relevant field in the Shelves and uncheck ``Show Header``.

* ``LOD Expressions`` (Level of Detail) can be used with measures and dimensions to stratify your visualization into different criteria based on the expression regardless of the dimensions present in the view.
    * After selecting a dimension and measure, use the drop-down menu of the measure to create a LOD expression.
    * ``Comments`` can be added to these expressions in C commenting style.
    * The following expression will calculate the sum of Profit at the Order ID level and return true if that value is >0 or false otherwise: ``{ FIXED [Order ID]: SUM([Profit]) } > 0``. 
    * Since this example produces discrete true/false categories, you can also change the ``alias`` of these to something else such as profitable/nonprofitable.
    * The order of these categories can be fixed by sorting them in the calculated field's drop down menu so they always show in the right order within the view.
    * This calculated field can be dragged into the ``Color`` portion of the Marks card to separate your current visualization into two colors based on the expression described above.

* ``Tooltips`` are the boxes that show up when hovering your mouse over a particular part of the visualization. These can be fully customized.
    * Drag fields into the ``Tooltip`` spot of the Marks card to add it to the current tooltips.
    * Click ``Tooltip`` in the Marks card to customize the full text shown, including the values displayed and colors.
    * Visualizations from one sheet can be inserted into the tooltips of another sheet by editing the tooltip and selecting ``Sheets`` under ``Insert``.

* ``Text Tables`` -- a.k.a. ``Cross tabs`` or ``Pivot Tables``
    * All measures and their default aggregate functions can be quickly added to the view to create a text table by dragging the automatic field ``Measure Names`` into the view. Unwanted measures can then be removed or filtered out, and the order can be changed by dragging.
    * Aggregate functions can be edited if the default is not the one required.

* ``Dashboards`` are used to combine visualizations in one place.
    * ``Tiled`` layout (bottom left) keeps things from overlapping, but a ``Floating`` layout is possible.
    * Drag and drop the necessary pieces from the ``Objects`` pane on the left into the view. ``Horizontal`` and ``Vertical`` refer to containers which you can place your visualizations into.
    * The ``Item Hierarchy`` is located in the ``Layout`` pane (left) and found at the bottom. This shows the organizational structure of all items in the dashboard. Use this to find, edit, and remove specific objects.
    * Filters shown in the dashboard will still only apply to the visualization they were created with. Use their drop down menus to apply them to all visualizations simulaneously.
    * ``Actions`` are found under the ``Dashboards`` tab at the top, and they allow you to control the interactivity of your dashboard. For example, clicking on a state in one visualization could be made to filter all other visualizations for only that state.
    * Titles of individual visualizations can be edited and even include dynamic text which could be related to Actions and filters.
    