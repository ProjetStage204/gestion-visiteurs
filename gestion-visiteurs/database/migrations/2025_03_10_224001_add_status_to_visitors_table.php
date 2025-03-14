<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('visitors', function (Blueprint $table) {
            $table->string('status')->default('En attente'); // Ajout du statut par défaut
        });
    }
    
    public function down()
    {
        Schema::table('visitors', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
    
};
