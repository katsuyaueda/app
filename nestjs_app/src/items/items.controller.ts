import { Body, Controller, Delete, Get, Param, ParseUUIDPipe, Patch, Post } from '@nestjs/common';
import { ItemsService } from './items.service';
import { Item } from './items.entity';

import { Status } from './status.enum';

@Controller('items')
export class ItemsController {
    constructor(private readonly itemsService: ItemsService) { }
    @Get()
    findAll(): Promise<Item[]> {
        return this.itemsService.findAll();
    }

    @Get(':id')
    findById(@Param('id', ParseUUIDPipe) id: string): Promise<Item> {
        return this.itemsService.findById(id);
    }

    @Post()
    create(
        @Body('task') task: string,
        @Body('description') description: string,
        @Body('status') status: Status,
    ): Promise<Item> {
        const item: Item = {
            id: '',
            task,
            description,
            status,
        };
        return this.itemsService.create(item);
    }

    @Patch(':id/status')
    updateStatus(
        @Param('id', ParseUUIDPipe) id: string,
        @Body('task') task: string,
        @Body('description') description: string,
        @Body('status') status: Status,
    ): Promise<Item> {
        return this.itemsService.updateStatus(id, status, task, description,);
    }

    @Delete(':id')
    delete(@Param('id', ParseUUIDPipe) id: string): Promise<void> {
        return this.itemsService.delete(id);
    }
}
