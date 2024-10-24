export interface Item {
    id: string;
    task: string;
    description: string;
    status: 'todo' | 'doing' | 'done';
}