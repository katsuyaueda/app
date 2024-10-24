// import { Module } from '@nestjs/common';
// import { ItemsController } from './items.controller';
// import { ItemsService } from './items.service';

// @Module({
//   controllers: [ItemsController],
//   providers: [ItemsService],
// })
// export class ItemsModule { }


import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ItemsService } from './items.service';
import { ItemsController } from './items.controller';
import { Item } from './items.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Item])], // リポジトリをインポート
  providers: [ItemsService],
  controllers: [ItemsController],
})
export class ItemsModule { }


