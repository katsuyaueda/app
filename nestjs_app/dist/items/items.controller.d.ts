import { ItemsService } from './items.service';
import { Item } from './items.entity';
import { Status } from './status.enum';
export declare class ItemsController {
    private readonly itemsService;
    constructor(itemsService: ItemsService);
    findAll(): Promise<Item[]>;
    findById(id: string): Promise<Item>;
    create(task: string, description: string, status: Status): Promise<Item>;
    updateStatus(id: string, task: string, description: string, status: Status): Promise<Item>;
    delete(id: string): Promise<void>;
}
