import { Repository } from 'typeorm';
import { Item } from './items.entity';
import { Status } from './status.enum';
export declare class ItemsService {
    private itemsRepository;
    constructor(itemsRepository: Repository<Item>);
    findAll(): Promise<Item[]>;
    findById(id: string): Promise<Item>;
    create(item: Item): Promise<Item>;
    updateStatus(id: string, newStatus: Status, newTask: string, newDescription: string): Promise<Item>;
    delete(id: string): Promise<void>;
}
