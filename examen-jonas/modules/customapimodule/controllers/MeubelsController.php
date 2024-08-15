<?php

namespace modules\customapimodule\controllers;

use Craft;
use craft\web\Controller;
use craft\elements\Entry;
use yii\web\Response;

class MeubelsController extends Controller
{
    // Allow anonymous access to this controller's actions
    protected array|bool|int $allowAnonymous = true;

    public function actionIndex(): Response
    {
        // Query the meubels section
        $meubelsEntries = Entry::find()
            ->section('meubels')
            ->limit(100)
            ->all();

        // Prepare the data to be returned as JSON
        $meubels = [];
        foreach ($meubelsEntries as $meubel) {
            $meubelImage = $meubel->meubelImage->one();
            $meubelData = [
                'category' => $meubel->categorien->one()->slug,
                'title' => $meubel->title,
                'beschrijving' => $meubel->beschrijving,
                'prijs' => $meubel->prijs,
                'image' => $meubelImage ? $meubelImage->getUrl('medium') : null,
            ];

            $meubels[] = $meubelData;
        }

        // Return the data as JSON
        return $this->asJson($meubels);
    }
}