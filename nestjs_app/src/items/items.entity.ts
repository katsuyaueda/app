import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Status } from './status.enum';




@Entity()
export class Item {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    task: string;

    @Column()
    description: string;

    @Column({
        type: 'enum',  // enum型を指定
        enum: Status,  // 使用するenum
        default: Status.TODO,  // デフォルト値を設定
    })
    status: Status;  // enum型に対応するプロパティを設定
}
