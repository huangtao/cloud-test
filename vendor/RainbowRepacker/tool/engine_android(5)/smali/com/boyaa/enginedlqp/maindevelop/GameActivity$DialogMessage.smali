.class public Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;
.super Ljava/lang/Object;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DialogMessage"
.end annotation


# instance fields
.field public message:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 540
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 541
    iput-object p2, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;->message:Ljava/lang/String;

    .line 542
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$DialogMessage;->title:Ljava/lang/String;

    .line 543
    return-void
.end method
