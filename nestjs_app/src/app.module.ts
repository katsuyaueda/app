// import { Module } from '@nestjs/common';
// import { ItemsModule } from './items/items.module';


// @Module({
//   imports: [ItemsModule],
//   controllers: [],
//   providers: [],
// })
// export class AppModule { }


import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Item } from './items/items.entity';
import { ItemsModule } from './items/items.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,  // 環境変数を全体で利用可能にする
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: 5432,
      username: 'postgres_training',
      password: 'postgres_training',
      database: 'postgres_training',
      entities: [Item],
      synchronize: true,
    }),
    ItemsModule
  ],
})
export class AppModule { }
