
<?php

use craft\elements\Entry;

return [
    'endpoints' => [
        'api/products.json' => function() {
            return [
                'elementType' => Entry::class,
                'criteria' => ['section' => 'products'],
                'transformer' => function(Entry $entry) {
                    return [
                        'id' => $entry->id,
                        'title' => $entry->title,
                        'beschrijving' => $entry->getFieldValue('beschrijving'),
                        'score' => $entry->getFieldValue('score'),
                       
                    ];
                },
            ];
        },
    ],
];
