.class public Lcom/boyaa/downloader/dao/DownloadDBOpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DownloadDBOpenHelper.java"


# static fields
.field public static final DB_NAME:Ljava/lang/String; = "boyaa_download.db"

.field public static final DB_TABLE_NAME:Ljava/lang/String; = "filedownlog"

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final TABLE_DOWNLOAD_LENGTH:Ljava/lang/String; = "downlength"

.field public static final TABLE_DOWNLOAD_PATH:Ljava/lang/String; = "downpath"

.field public static final TABLE_THREAD_ID:Ljava/lang/String; = "threadid"

.field private static final TAG:Ljava/lang/String;

.field private static final VERSION:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/boyaa/downloader/dao/DownloadDBOpenHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/downloader/dao/DownloadDBOpenHelper;->TAG:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    const-string v0, "boyaa_download.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 57
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 62
    const-string v0, "CREATE TABLE IF NOT EXISTS filedownlog (_id integer primary key autoincrement, downpath varchar(100), threadid INTEGER, downlength INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 71
    const-string v0, "DROP TABLE IF EXISTS filedownlog"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, p1}, Lcom/boyaa/downloader/dao/DownloadDBOpenHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 73
    return-void
.end method
