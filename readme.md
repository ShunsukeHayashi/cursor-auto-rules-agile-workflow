# Cursor Auto Rules Agile Workflow

アジャイル開発、ルールベース自動化、ログ駆動開発（LDD）を統合した効率的な開発環境フレームワーク。

## 特徴

- アジャイルワークフローの自動化
- ルールベースの開発プロセス
- ログ駆動開発（LDD）の統合
- 継続的な最適化メカニズム

## ディレクトリ構造

```
プロジェクトルート/
├── .ai/                    # アジャイル管理
│   ├── prd.md             # 製品要件
│   ├── arch.md            # アーキテクチャ
│   └── epic-{n}/          # エピック管理
│
├── .cursor/rules/         # ルール管理
│   ├── 000-cursor-rules.mdc  # ルール基本定義
│   ├── 801-workflow-agile.mdc # 統合ワークフロー
│   ├── 901-prd.mdc       # PRDテンプレート
│   ├── 902-arch.mdc      # アーキテクチャテンプレート
│   └── 903-story.mdc     # ストーリーテンプレート
│
├── .logs/                 # LDD（ログ駆動開発）
│   └── TASK-{n}-{name}.md # タスクログ
│
├── docs/                  # ドキュメント
├── xnotes/               # 開発ノート
├── @logging_template.mdc  # ログテンプレート
└── @memory-bank.mdc      # メモリーバンク
```

## セットアップ

1. リポジトリのクローン:
```bash
git clone https://github.com/yourusername/cursor-auto-rules-agile-workflow.git
cd cursor-auto-rules-agile-workflow
```

2. ルールの適用:
```bash
./apply-rules.sh /path/to/your/project
```

## 使用方法

### ルールベースアプローチ

1. `.cursor/rules/`ディレクトリのテンプレートを使用
2. 自動ルール適用による一貫性の維持
3. メトリクスベースの最適化

### ノートパッドアプローチ

1. `xnotes/`のテンプレートを使用
2. より柔軟な開発セッション
3. フォーカスされた実装

## ワークフロー

1. プロジェクト初期化
2. PRDとアーキテクチャの承認
3. エピックとストーリーの実装
4. 継続的なフィードバックと最適化

## 貢献

1. Forkしてリポジトリをクローン
2. 新しいブランチを作成
3. 変更をコミット
4. Pull Requestを作成

## ライセンス

MIT

## 作者

BMad Code
