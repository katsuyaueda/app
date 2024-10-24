// import { Injectable } from '@nestjs/common';
// import { Item } from './items.model';
// import { CreateItemDto } from './DTO/create-item.dto';
// import { v4 as uuid } from 'uuid'

// @Injectable()
// export class ItemsService {
//     private items: Item[] = []
//     findAll(): Item[] {
//         return this.items;
//     }

//     findById(id: string): Item {
//         return this.items.find((item) => item.id === id);
//     }

//     create(CreateItemDto: CreateItemDto): Item {
//         const item: Item = {
//             id: uuid(),
//             ...CreateItemDto
//         };
//         this.items.push(item);
//         return item;
//     }

//     updateStatus(id: string, newStatus: 'todo' | 'doing' | 'done',
//         newTask: string, newDescription: string,): Item {
//         const item = this.findById(id);
//         item.status = newStatus; // ステータスを更新
//         item.task = newTask;
//         item.description = newDescription;

//         return item;
//     }

//     delete(id: string) {
//         this.items = this.items.filter((item) => item.id !== id);
//     }
// }


import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Item } from './items.entity';

import { Status } from './status.enum';
import { v4 as uuid } from 'uuid';

@Injectable()
export class ItemsService {
    constructor(
        @InjectRepository(Item)
        private itemsRepository: Repository<Item>, // リポジトリを注入
    ) { }

    findAll(): Promise<Item[]> {
        return this.itemsRepository.find();
    }

    findById(id: string): Promise<Item> {
        return this.itemsRepository.findOne({ where: { id } });
    }

    // create(createItemDto: CreateItemDto): Promise<Item> {
    //     const item = this.itemsRepository.create(createItemDto);
    //     return this.itemsRepository.save(item);
    // }

    create(item: Item): Promise<Item> {
        item.id = uuid();  // UUIDを生成してidにセット
        return this.itemsRepository.save(item);  // データベースに保存
    }

    // async updateStatus(id: string, newStatus: string): Promise<Item> {
    //     const item = await this.findById(id);
    //     item.status = newStatus;
    //     return this.itemsRepository.save(item);
    // }
    async updateStatus(id: string, newStatus: Status,
        newTask: string, newDescription: string,): Promise<Item> {
        const item = await this.findById(id);
        item.status = newStatus; // ステータスを更新
        item.task = newTask;
        item.description = newDescription;

        return this.itemsRepository.save(item);
    }

    async delete(id: string): Promise<void> {
        await this.itemsRepository.delete(id);
    }
}
