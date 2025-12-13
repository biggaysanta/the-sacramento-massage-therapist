# W3CSS to #TailwindCSS Mappings

This table provides a direct mapping from popular W3.CSS classes to their functional equivalents in Tailwind CSS. Because Tailwind is a utility-first framework, a single W3.CSS class often corresponds to a combination of Tailwind classes.

Layout and Containers
|

| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-container | A standard container with 16px padding. | px-4 py-2 or p-4. For horizontal centering, use container mx-auto. |
| w3-panel | A container with padding and a margin. | p-4 rounded-md my-4 |
| w3-card, w3-card-2 | A card-like container with a shadow. | bg-white rounded-lg shadow-md p-6 |
| w3-card-4 | A card with a stronger shadow. | bg-white rounded-lg shadow-lg p-6 |
| w3-row | A flexbox-based row. | flex flex-wrap |
| w3-col | A flexbox-based column. | w-full md:w-1/2 lg:w-1/3 (and similar responsive widths) |

Colors and Themes
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-blue | Adds a blue background. | bg-blue-500 (or another shade like bg-blue-600) |
| w3-text-blue | Adds blue text color. | text-blue-500 |
| w3-hover-blue | Changes background to blue on hover. | hover:bg-blue-500 |
| w3-hover-text-blue | Changes text to blue on hover. | hover:text-blue-500 |

Typography
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-serif | Sets font to a serif family. | font-serif |
| w3-monospace | Sets font to a monospace family. | font-mono |
| w3-tiny | Extra small font size. | text-xs |
| w3-small | Small font size. | text-sm |
| w3-large | Large font size. | text-lg |
| w3-xlarge | Extra large font size. | text-xl |
| w3-xxlarge | Double extra large font size. | text-2xl |
| w3-xxxlarge | Triple extra large font size. | text-3xl |
| w3-jumbo | Very large font size. | text-6xl md:text-7xl lg:text-8xl (or similar responsive sizes) |

Buttons
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-button | A basic button style. | inline-block px-6 py-2 text-center font-bold rounded-lg shadow-md |
| w3-round | Rounded button corners. | rounded-lg |
| w3-round-large | More rounded button corners. | rounded-xl |
| w3-disabled | Grayed-out disabled button. | disabled:bg-gray-400 disabled:text-gray-600 disabled:cursor-not-allowed |

Forms
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-input | A full-width input field. | w-full p-2 border border-gray-300 rounded-md focus:ring focus:ring-blue-500 focus:outline-none |
| w3-label | A standard label for form elements. | block text-sm font-medium text-gray-700 |

Images
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-image | Makes image responsive. | w-full h-auto |
| w3-circle | Crops image into a circle. | rounded-full |

Tables
| W3.CSS Class | Description | Tailwind CSS Equivalent |
| w3-table | Standard table styles. | w-full text-left table-auto |
| w3-striped | Adds alternating row colors. | even:bg-gray-100 |
| w3-border | Adds borders to the table. | border-collapse border border-gray-300 |