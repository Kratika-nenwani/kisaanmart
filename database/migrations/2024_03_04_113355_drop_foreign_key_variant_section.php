<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('variants', function (Blueprint $table) {
            
            $table->dropForeign(['section_id']);
            $table->dropForeign(['brand_id']);
            $table->dropForeign(['category_id']);
            $table->dropForeign(['subcategory_id']);
            $table->dropForeign(['product_id']);
        
            $table->foreign('section_id')
                  ->references('id')
                  ->on('sections')
                  ->onDelete('cascade');
        
            $table->foreign('brand_id')
                  ->references('id')
                  ->on('sections')
                  ->onDelete('cascade');

            $table->foreign('category_id')
                  ->references('id')
                  ->on('sections')
                  ->onDelete('cascade');

            $table->foreign('subcategory_id')
                  ->references('id')
                  ->on('sections')
                  ->onDelete('cascade');

            $table->foreign('product_id')
                  ->references('id')
                  ->on('sections')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
