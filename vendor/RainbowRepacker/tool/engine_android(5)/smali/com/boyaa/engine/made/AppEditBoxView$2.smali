.class final Lcom/boyaa/engine/made/AppEditBoxView$2;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->closeIMEEdit()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 123
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    if-eqz v0, :cond_0

    .line 124
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->delete()V

    .line 125
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    .line 127
    :cond_0
    return-void
.end method
