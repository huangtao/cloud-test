.class Lcom/boyaa/engine/made/AppEffect$SoundItem;
.super Ljava/lang/Object;
.source "AppEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/made/AppEffect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SoundItem"
.end annotation


# instance fields
.field public customID:I

.field public path:Ljava/lang/String;

.field public soundID:I

.field public streamID:I

.field final synthetic this$0:Lcom/boyaa/engine/made/AppEffect;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEffect;)V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 31
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->this$0:Lcom/boyaa/engine/made/AppEffect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput v0, p0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    .line 27
    iput v0, p0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    .line 28
    iput v0, p0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    .line 32
    sget v0, Lcom/boyaa/engine/made/AppEffect;->sCustomID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/boyaa/engine/made/AppEffect;->sCustomID:I

    iput v0, p0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    .line 33
    return-void
.end method
